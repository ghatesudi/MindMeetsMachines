### \# \\\*\\\*\\\[C01 Systemic Lupus Erythematous (SLE)\\\](\[https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C01)\](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C01\\))\\\*\\\*

Part 1: Vignette
You are an epidemiologist at a biopharma company. Your immediate objective is to deliver a high-PPV concept set for Systemic Lupus Erythematosus (SLE) — Systemic, to be embedded within a validated prevalent, active, moderate-to-severe SLE phenotype algorithm used for characterization, comparative effectiveness, and HTA-relevant steroid-sparing analyses.

Data Environment You will work across large administrative claims and EHR datasets standardized to the OMOP Common Data Model (CDM). Concept sets must be authored in standardized vocabularies (SNOMED CT as standard; ICD-10-CM as source) and be Condition domain only. (Laboratory, procedures, drugs, visits, and specialty are handled by separate concept sets and the phenotype algorithm, not this concept set.)

Key Epidemiological Parameters (from the study design that will use this concept set)

Target population: Patients with prevalent, systemic SLE capable of having active, moderate-to-severe disease. Age inclusive (adult & pediatric). Pregnancy status not a restriction for cohort entry.
Index anchoring: Diagnosis-anchored; in the phenotype, confirmation may occur via repeat diagnosis, rheumatology proximity, SLE-directed therapy, or serology.
Required lookback: ≥365 days prior observation (for downstream baseline covariates).
Nature of condition for this use case: Prevalent SLE (not incident).
Core exclusions handled at concept-set level: cutaneous-only lupus, drug-induced lupus, neonatal lupus, “history of”/“screening for”/“rule-out” lupus, isolated antiphospholipid/lupus anticoagulant without SLE.
Confounding & severity: Managed in phenotype & study design via steroid dose strata, flare proxies, organ involvement flags, treatment history—not by broadening/complicating the diagnosis code list.

Structured Research Question (OHDSI Madlibs style, exemplar for downstream analyses) “Among patients with prevalent systemic SLE in OMOP-standardized claims/EHR data, what is the 12-month pre-index distribution of average daily oral glucocorticoid dose and the 12-month post-initiation risk of inadequate response after starting anifrolumab or belimumab, measured during a study-specific time-at-risk?”

Concept Set Challenge (singular, unambiguous)

Build the Concept Set: “Systemic Lupus Erythematosus — Systemic (Condition domain)” Scope = diagnosis codes that explicitly denote systemic SLE (including “SLE with organ involvement”). Explicitly exclude: cutaneous-only lupus, drug-induced lupus, neonatal lupus, “history of”/“screening”/“rule-out”/“suspected” lupus, isolated antiphospholipid/lupus anticoagulant without SLE. Do not include labs, drugs, visits, specialty, or procedures here (they are separate concept sets).


Part 2: Structured Clinical Specification
(Deterministic guidance for code inclusion/exclusion; informs but does not encode phenotype logic.)
1. Core Clinical Definition
Case Definition (clinical meaning of the target concept) A chronic, systemic autoimmune disease characterized by multisystem involvement and immunologic abnormalities consistent with SLE (e.g., anti-dsDNA and/or anti-Sm antibodies, hypocomplementemia). In routine care, SLE is managed primarily by rheumatology and treated with antimalarials, immunosuppressants, biologics, and judicious glucocorticoids.

Diagnostic Criteria (for context; not encoded in this concept set)

Serology: ANA (entry), anti-dsDNA and/or anti-Sm positivity; low C3/C4.
Organ involvement: renal (proteinuria, biopsy-proven LN), hematologic, mucocutaneous, musculoskeletal, neuropsychiatric, serositis.
Classification frameworks (e.g., 2019 EULAR/ACR) inform measurement concept sets but are not used to gate diagnosis codes here.

Presentation & Course Relapsing-remitting with flares and remissions; severity ranges from mild mucocutaneous/arthralgia to life-threatening organ disease (e.g., nephritis). Long-term morbidity strongly influenced by cumulative glucocorticoid exposure.

Synonyms & Closely Related Terms (for search mapping) Systemic lupus erythematosus; SLE; systemic lupus; disseminated lupus erythematosus (historic); lupus with organ involvement (e.g., “SLE with nephritis”). Do not conflate with cutaneous lupus or drug-induced lupus.

Differential Diagnoses  (Conditions to be distinguished and not considered inclusive) Cutaneous lupus erythematosus (CLE), drug-induced lupus (DIL), neonatal lupus, undifferentiated connective tissue disease, mixed connective tissue disease, systemic sclerosis, dermatomyositis/polymyositis, Sjögren’s, rheumatoid arthritis, antiphospholipid syndrome (APS) without SLE.

Common Treatments/Management (signals of disease, handled elsewhere) Hydroxychloroquine, azathioprine, mycophenolate, methotrexate, cyclophosphamide; calcineurin inhibitors (e.g., tacrolimus; voclosporin for LN); biologics (belimumab, anifrolumab); off-label rituximab; systemic glucocorticoids (oral and pulse). These support phenotype confirmation but are not part of this diagnosis concept set.


2. Scope Boundaries and Exclusions (deterministic)
IN SCOPE (include):

Diagnosis concepts that explicitly reference systemic SLE, including general SLE and “SLE with organ involvement” (e.g., renal, hematologic, neurologic).
Pediatric/juvenile SLE terms when clearly systemic.
Source codes that map (via OMOP) to standardized SNOMED CT “Systemic lupus erythematosus (disorder)” and descendants representing systemic disease (not cutaneous/drug-induced/neonatal).

OUT OF SCOPE (exclude):

Cutaneous-only lupus (all forms, including discoid, subacute cutaneous).
Drug-induced lupus (all forms).
Neonatal lupus.
“History of”, “personal history of”, “screening for”, “suspected”, “rule-out” lupus and other non-current/problem-list or administrative qualifiers.
Isolated antiphospholipid syndrome/lupus anticoagulant without an SLE diagnosis.
Non-SLE entities containing the word “lupus” (e.g., lupus vulgaris—cutaneous TB).

Edge-Case Resolutions (apply consistently):

“Lupus nephritis”:

Include when the code/text explicitly links nephritis to SLE (e.g., “SLE with nephritis”).
Exclude renal codes without an SLE reference (use a separate LN concept set for organ-severity analyses).

Overlap syndromes (e.g., SLE + systemic sclerosis): Include the SLE diagnosis if the code is an SLE code; exclusions for competing CTDs are handled in the phenotype algorithm.

Remission modifiers: If the code is a problem-status indicating history/remission rather than a current SLE diagnosis, exclude.


3. Temporal Context (crucial)
Temporality requirement for this concept set: Prevalent SLE.

Impact on code selection:

Exclude “history of”, “screening”, “suspected/rule-out” constructs.
Do not attempt to encode incident status, confirmation intervals, or activity here—those are phenotype logic elements using separate concept sets (labs, drugs, specialty, visits).


4. Clinical Granularity & Use-Case Requirements
Severity/Acuity: The diagnosis concept set is severity-agnostic by design. Severity (“active, moderate-to-severe”) will be operationalized in the phenotype via steroid dose strata, flare proxies, and organ involvement flags.

Etiology: Restrict to primary systemic SLE; exclude drug-induced lupus.

Sensitivity/Specificity Trade-off: For downstream comparative effectiveness & HTA, precision (PPV) is prioritized.

Prefer explicit systemic SLE terms.
Avoid broad/ambiguous “lupus” terms that do not specify systemic disease.
Keep cutaneously-scoped and drug-induced constructs out to protect PPV.


5. Population & Data Context
Population subgroups (handled in study/phenotype, not in this concept set): pediatric vs adult; renal involvement; baseline glucocorticoid dose strata; prior biologic exposure; refractory trajectory flags.

Do not include Measurement, Drug, Visit/Provider-specialty, or Procedure concepts here. Those belong to separate concept sets:

Serologies (ANA, anti-dsDNA, anti-Sm, C3/C4)
Glucocorticoids (oral/pulse), antimalarials, ISDs, biologics
Rheumatology specialty visits; ED/inpatient visits
Renal biopsy; urine protein/proteinuria measures


Title: SLE — Systemic (diagnosis, Condition domain; excludes cutaneous/drug-induced/neonatal; excludes history/screening/suspected; includes “SLE with organ involvement”)

Intended Use Note: Built for prevalent SLE phenotyping in CE/HTA workflows with PPV priority; severity/activity handled outside the diagnosis concept set.

