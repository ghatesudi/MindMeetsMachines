[C03 Diabetic Macular Edema (DME)](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C03)

## Part 1: Vignette

You are an observational epidemiologist at a biopharmaceutical company (2025–2026) designing RWD studies to characterize treated, *active* Diabetic Macular Edema (DME) and to size the population with high treatment burden despite contemporary anti-VEGF therapy. Your immediate task is to deliver a deterministic, single-idea concept set for “Diabetic Macular Edema (Condition)” that will plug into a treatment-anchored cohort definition.

**Data Environment** Multiple network administrative claims and EHR networks standardized to the OMOP Common Data Model.

*Key Epidemiological Parameters (study design the concept set supports for the following phenotype algorithm)*

* Target population: Persons with diabetes (T1DM or T2DM) who initiate a new course of DME therapy between Jan 1, 2022 and Dec 31, 2024.
* Index date (T₀): First qualifying intravitreal anti-VEGF, intravitreal/periocular steroid implant, or focal/grid macular laser in 2022–2024 (PRP excluded), earliest per person.
* Lookback (restriction): ≥365 days continuous observation before T₀.
* New-course rule: No ocular anti-VEGF in −180d to −1d; no steroid implant in −270d to −1d (*or a single uniform −210d hiatus if needed*).
* Active-indication confirmation (uses this concept set): ≥1 DME diagnosis in −90d to +14d relative to T₀, recorded in an eye-care context (ophthalmology/retina/optometry visit −30d to +7d).
* Exclusions near T₀ (handled by phenotype, not by the DME concept set): nAMD, CRVO/BRVO, myopic/PCV CNV, uveitic CME, postoperative CME; systemic anti-VEGF/oncology context.
* Exit: End of continuous observation; analysis-stage windows (e.g., 12 or 18 months) applied post-cohort.

**Structured Research Question (OHDSI-style “madlibs”)**

* *Among* adults with diabetes who start a new course of DME therapy in 2022–2024 with ≥365d prior observation, *what is the* 12–18 month *distribution of* injection burden, persistence, and switching *for* faricimab vs aflibercept 8mg, *and what proportion meet a* suboptimal-response *definition?*

**Concept Set Challenge (single, unambiguous idea)**

Build the “Diabetic Macular Edema (Condition)” concept set for *active*, treated DME near T₀.

*Scope:* clinical diagnosis codes that assert *current* DME attributable to diabetes. 
*Out of scope:* historical/suspected DME; generic/unspecified macular edema without diabetic attribution; codes for other retinal diseases.

---

## Part 2: The Structured Clinical Specification

*(for the DME Condition concept set only; phenotype logic lives outside this section)*

### 1) Core Clinical Definition

**Case Definition** Retinal thickening and/or intra/sub-retinal fluid in the macula **due to diabetes mellitus** (type 1 or 2). In routine care this is the diagnosis recorded when the clinician is treating or planning to treat *diabetes-attributable macular edema* (center-involved or not).

**Diagnostic Criteria**

* Required etiologic link: Explicit diabetic attribution in the diagnosis text/term (e.g., “diabetic macular edema,” “diabetic retinopathy with macular edema,” “diabetic maculopathy with edema”).
* Objective confirmation (clinical reality; may not be codified): OCT evidence of macular thickening and/or intra/sub-retinal fluid.
* Diabetes present: Prior or concurrent diagnosis of diabetes mellitus (any type).

**Presentation & Course** Blurred vision, metamorphopsia; may be asymptomatic early. Often chronic, managed with anti-VEGF, steroids, and/or focal/grid laser; treat-and-extend or PRN patterns common.

**Synonyms & Closely Related Terms**  (for search mapping)

* Diabetic macular edema (DME)
* Diabetic maculopathy with macular edema
* Diabetic retinopathy with macular edema / “with macular edema” modifiers
* Center-involved DME (CI-DME)
* *Legacy/ambiguous term to include only if it maps specifically to diabetic edema:* Clinically significant macular edema (CSME) when explicitly diabetic; otherwise exclude (see below).

**Differential Diagnoses** (Conditions to be distinguished and not considered inclusive) 

* Neovascular age-related macular degeneration (nAMD)
* Retinal vein occlusions (CRVO/BRVO) with macular edema
* Polypoidal choroidal vasculopathy; myopic CNV
* Post-operative cystoid macular edema (Irvine–Gass)
* Uveitic cystoid macular edema
* **Unspecified macular edema** without diabetic attribution

**Common Treatments/Management** Intravitreal anti-VEGF; intravitreal/periocular corticosteroids (dexamethasone, fluocinolone implants); focal/grid macular laser; serial OCT monitoring.

---

### 2) Scope Boundaries & Exclusions (deterministic)

**Include:**

* Terms whose label **states diabetic etiology and macular edema** (e.g., “diabetic macular edema,” “diabetic retinopathy with macular edema,” “macular edema due to diabetes mellitus”).
* Laterality or center-involved qualifiers (if present) are in scope.
* Pediatric/adult distinctions are in scope if etiologic diabetes is present.

**Exclude:**

* **History of** DME / **resolved** DME / **screening for** diabetic eye disease.
* **Unspecified macular edema** (no diabetic attribution).
* Cystoid macular edema without diabetic attribution.
* **Diabetic retinopathy without** mention of macular edema.
* Non-diabetic retinal diseases even if they co-occur with diabetes (nAMD, CRVO/BRVO, myopic/PCV CNV, uveitic or postoperative CME).
* Tele-screening “rule-out”/“suspected” terms.
* Pure laterality markers without disease terms (do not add on their own).

---

### 3) Temporal Context (crucial; governs term selection)

**Temporality Requirement:** **Prevalent, *active*** disease around T₀. The concept set must **exclude “history of / past / resolved”** constructs.

**Impact on Code Selection:**

* Include only diagnostic assertions of *current* DME.
* Exclude “personal history,” “status-post,” “probable/suspected,” and generic “encounter for screening” codes.
* Do not bake washout, OCT timing, or visit-type logic into the concept set; those are enforced by the phenotype.

---

### 4) Clinical Granularity & Use-Case Requirements

**Severity/Acuity:** No restriction at the concept level.

**Etiology Constraint:** **Diabetes-attributable only.**

**Sensitivity vs Specificity:**

* **Priority: High PPV (specificity)**. Prefer under-capture of ambiguous terms over misclassification.
* If a term (e.g., legacy CSME) ambiguously maps to diabetic vs non-diabetic edema, **exclude by default**.

---

### 5) Population & Data Context

**Population Subgroups (handled by phenotype algorithm or analysis design specifications):** Adults with diabetes (type 1 or 2).

This concept set identifies only the Condition “Diabetic Macular Edema (active, diabetic-attributable)” at a point in time; it does not encode temporal logic, imaging, visit context, therapy exposure, exclusions for other retinal diseases, or washout—those are handled entirely by the phenotype and study design.

tagging @cindyxcai