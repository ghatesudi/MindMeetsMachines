# install package and dependencies
remotes::install_github("OHDSI/ROhdsiWebApi")
install.packages("RJSONIO")
install.packages("jsonlite")
install.packages("readr")


# Metadata
## access the webapi
baseUrl <- "http://136.115.218.43/WebAPI"


## if concept sets are in atlas (i.e. after phase 1 - get list of all intersting concept sets from atlas)
conceptSetsInAtlasOfInterest <- ROhdsiWebApi::getConceptSetDefinitionsMetaData(baseUrl = baseUrl)
## filter to conceptSetIdsOfInterest


outputFolderBase <- "C:\\files\\pathToOutput\\phenotypeDevelopmentEvaluationWorkGroup"




for (i in (1:nrow(conceptSetsInAtlasOfInterest))) {
  conceptSetId <- conceptSetsInAtlasOfInterest[i, ]$id
  print(paste0("Working on concept set id ", conceptSetId))
  
  # get concept set definition specifications in r object list form
  conceptSetDefinition <- ROhdsiWebApi::getConceptSetDefinition(conceptSetId = conceptSetId, baseUrl = baseUrl)
  
  
  outputName <- paste0(sprintf("%04d", conceptSetDefinition$id),
                       "-",
                       conceptSetDefinition$name)
  
  finalPath <- file.path(outputFolderBase, outputName)
  dir.create(path = finalPath,
             showWarnings = FALSE,
             recursive = TRUE)
  
  
  # save concept set json
  conceptSetDefinition$expression |>
    RJSONIO::toJSON(digits = 23) |>
    jsonlite::prettify() |>
    writeLines(file.path(finalPath, paste0("conceptSetExpression", ".json")))
  
  # get included concepts by resolving - this posts the concept set expression to webapi and get payload with concept ids
  conceptSetDefinitionResolved <- ROhdsiWebApi::resolveConceptSet(conceptSetDefinition = conceptSetDefinition, baseUrl = baseUrl)
  
  # this posts conceptSetIds to webapi, to get concept id details in data frame
  if (!is.null(conceptSetDefinitionResolved)) {
    conceptSetDefinitionDetails <- ROhdsiWebApi::getConcepts(
      conceptIds = conceptSetDefinitionResolved,
      baseUrl = baseUrl,
      snakeCaseToCamelCase = TRUE
    )
    
    # appends metadata of the conceptSetId to the included conceptIdDetails
    resolvedSetOfConceptSets <- conceptSetsInAtlasOfInterest |>
      dplyr::filter(id == conceptSetId) |>
      dplyr::rename(conceptSetId = id, conceptSetName = name) |>
      dplyr::select(conceptSetId, conceptSetName) |>
      dplyr::cross_join(
        conceptSetDefinitionDetails |>
          dplyr::select(
            conceptId,
            conceptName,
            standardConcept,
            invalidReason,
            conceptCode,
            # domainId,
            vocabularyId,
            # conceptClassId,
            # validStartDate,
            # validEndDate
          )
      ) |>
      dplyr::arrange(conceptId)
    
    readr::write_excel_csv(
      x = resolvedSetOfConceptSets,
      file = file.path(finalPath, "includedConcepts.csv"),
      na = "",
      append = FALSE,
      quote = "all"
    )
    
    sourceConcepts <- ROhdsiWebApi::getSourceConcepts(
      conceptIds = conceptSetDefinitionDetails$conceptId |> unique(),
      baseUrl = baseUrl,
      snakeCaseToCamelCase = TRUE
    ) |>
      dplyr::distinct() |>
      dplyr::select(
        conceptId,
        conceptName,
        standardConcept,
        invalidReason,
        conceptCode,
        # domainId,
        vocabularyId,
        # conceptClassId,
        # validStartDate,
        # validEndDate
      )
    
    mappedConcepts <- conceptSetsInAtlas |>
      dplyr::filter(id == conceptSetId) |>
      dplyr::rename(conceptSetId = id, conceptSetName = name) |>
      dplyr::select(conceptSetId, conceptSetName) |>
      dplyr::cross_join(sourceConcepts) |>
      dplyr::arrange(conceptId)
    
    readr::write_excel_csv(
      x = mappedConcepts,
      file = file.path(finalPath, "mappedConcepts.csv"),
      na = "",
      append = FALSE,
      quote = "all"
    )
    
  }
  
}
