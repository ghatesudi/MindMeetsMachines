# [C05 Ovarian Cancer](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C05)


(The instruction set below is to help develop a concept set that represents a single, point-in-time clinical idea. All temporal logic (e.g., platinum-free interval ≤6 months) is handled by the phenotype/cohort, not by the concept set.)

---

## Part 1: Vignette

You are an RWE epidemiologist in a pharmaceutical HEOR/medical-evidence team. Your immediate objective is to construct one high-precision condition concept set to be re-used across multiple PROC studies: the diagnosis of epithelial ovarian, fallopian tube, or primary peritoneal carcinoma at any time in a patient’s history (active malignancy), not including non-epithelial and history/uncertain-behavior codes. This concept set will serve as the disease backbone inside cohort definitions that identify platinum-resistant relapse using phenotype logic (PFI ≤6 months, progression evidence, line-of-therapy transitions).

*Data Environment.* Multi-country administrative claims ± EHR networks standardized to the OMOP CDM. Optional histology detail may appear via site-specific mappings (e.g., ICD-O-3).

*Key Epidemiological Parameters* (from the study program using this concept set).

* Target population (high level): Women with relapsed/refractory PROC initiating new systemic therapy in 2L–3L.
* Index anchoring (cohorts): New-user start of a non-platinum PROC regimen (treatment T0).
* Required observation: ≥12 months pre-index for baseline and prior platinum ascertainment.
* Outcome framing: Incident relapse episode; time-at-risk typically on-treatment + 30 days; progression/OS/HCRU endpoints.
* Crucial note: Platinum resistance (PFI ≤6 months), RECIST/GCIG progression, LoT confirmation, and exclusions like pregnancy are phenotype logic decisions—not part of this concept set.

Research Question (OHDSI “madlibs”). *“Among women with epithelial ovarian/fallopian/primary peritoneal carcinoma [Target], during on-treatment + 30 days after new start of weekly paclitaxel ± bevacizumab [Time-at-risk], what is the 12-month rwPFS [Outcome] in those meeting PFI ≤6 months and other PROC eligibility criteria [Context from phenotype]?”*

Concept Set Challenge (singular).

**CS1 — Epithelial ovarian, fallopian tube, or primary peritoneal carcinoma (epithelial histologies only; active malignancy; exclude history/uncertain behavior).**

---

## Part 2: Structured Clinical Specification (for CS1)

Scope reminder: This is a Condition concept set (a point-in-time diagnosis event). It does not embed platinum-resistance, incident/prevalent status, or line-of-therapy timing—those belong to the phenotype algorithm.

### 1) Core Clinical Definition

Case Definition (clinical description). Primary epithelial malignancy originating in the ovary, fallopian tube, or primary peritoneum. Predominant histology is high-grade serous carcinoma; other epithelial subtypes include low-grade serous, endometrioid, clear cell, mucinous, malignant Brenner (transitional), squamous, and carcinosarcoma (MMMT) when primary to these anatomic sites.

Diagnostic Criteria (how the diagnosis is established clinically—not all are codified).

* Tissue diagnosis from cytoreductive surgery or biopsy confirming epithelial carcinoma of ovary/tube/peritoneum.
* Imaging supportive of pelvic/adnexal mass and peritoneal disease; CA-125 commonly elevated but not specific.
* In routine data, diagnosis is represented via oncology malignant neoplasm codes mapped to SNOMED; histology specificity varies by site.

Presentation & Course (typical).

* Often presents with abdominal distension, ascites, or pelvic mass; frequent peritoneal spread.
* Relapse is common after platinum-taxane; subsequent studies apply phenotype logic (PFI ≤6 months) to classify PROC.

Synonyms & Closely Related Terms (include to improve recall, then filter via exclusions below).

* “Epithelial ovarian cancer,” “ovarian carcinoma,” “fallopian tube carcinoma,” “primary peritoneal carcinoma,” “high-grade serous ovarian carcinoma (HGSOC),” “serous/endometrioid/clear cell/mucinous ovarian carcinoma,” “ovarian carcinosarcoma,” “malignant Brenner tumor (ovary).”

Differential Diagnoses (to be excluded in the concept set).

* Non-epithelial ovarian tumors: germ-cell (e.g., dysgerminoma, yolk sac), sex-cord stromal (e.g., granulosa cell, Sertoli-Leydig).
* Borderline (low malignant potential) epithelial tumors.
* Metastatic carcinoma to ovary (e.g., Krukenberg from GI) or secondary peritoneal carcinomatosis from non-gynecologic primaries.
* History of ovarian cancer without current active disease.

Common Treatments/Management (signals the disease exists; not for concept set logic). Primary cytoreductive surgery; 1L platinum-taxane ± bevacizumab; maintenance PARP in appropriate patients; subsequent non-platinum regimens ± bevacizumab; FRα-targeted ADC for FRα-high; IO/targeted regimens in trials/practice.

---

### 2) Scope Boundaries & Explicit Exclusions (apply at code level)

IN SCOPE (must include):

* Malignant epithelial neoplasms of ovary (primary), fallopian tube, and/or primary peritoneum.

OUT OF SCOPE (must exclude):

* Non-epithelial ovarian malignancies (germ-cell; sex-cord stromal).
* Borderline / uncertain behavior / in situ neoplasms of ovary/tube/peritoneum.
* Secondary malignant neoplasms of ovary/peritoneum.
* History of malignant neoplasm of ovary/other gynecologic sites as they may have been cured/resected/remission.
* Generic “malignant neoplasm of peritoneum” codes as they may represent secondary and not primary.

---

### 3) Temporal Context (for downstream cohort logic; guidance for code choice)

Temporality Requirement for THIS concept set:

* None—it represents a diagnosis event (present/active malignant disease).
* Do not include “personal history of” codes or “ruled out”/screening codes; prefer active malignant diagnosis concepts.

Impact on Code Selection:

* Because downstream studies will enforce PROC incidence (PFI ≤6 months) in the phenotype, the concept set should not attempt to encode “platinum-resistant.”
* Exclude explicit “history of” terms to avoid misclassifying prevalent-but-inactive disease during relapse cohort entry.

---

### 4) Clinical Granularity & Use-Case Requirements

Severity/Acuity.

* Include all epithelial malignant grades (low- and high-grade) and stages; do not restrict by stage in the concept set.

Etiology.

* Restrict to primary epithelial origin at ovary/tube/peritoneum.
* Include ovarian carcinosarcoma/MMMT when coded as primary ovarian/fallopian/peritoneal carcinoma (treated as epithelial/metaplastic carcinoma).
* Exclude peritoneal/ovarian sites when coded as secondary from other primaries.

Sensitivity/Specificity Trade-off (study requirement).

* This concept set should prioritizes specificity/PPV (regulatory/HTA-oriented analyses).

* Therefore: include only malignant, primary, epithelial terms; exclude uncertain behavior/borderline/history/secondary sites..

---

### 5) Population & Data Context

Population Subgroups (downstream stratification only).

* Analyses may stratify by FRα, PD-L1 CPS, CCNE1, prior PARP/bev, age, comorbidity—not part of this concept set.

Data Environment Specifics.

* EHR vs Claims: claims often lack histology granularity—favor anatomic site + malignancy terms that reliably map to primary epithelial carcinoma; avoid peritoneal codes lacking “primary” specification.

* Histology enrichment (optional, site-dependent): Include SNOMED descendants for serous/endometrioid/clear cell/mucinous/carcinosarcoma when the anatomic site is ovary/tube/peritoneum and the concept denotes malignant primary disease.