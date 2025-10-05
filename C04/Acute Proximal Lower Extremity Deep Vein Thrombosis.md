# [C04 Acute Proximal Lower-Extremity Deep-Vein Thrombosis (LE-DVT)](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C04)

## Part 1: Vignette

You are an epidemiologist in a pharma RWE group preparing launch-readiness evidence for an FXI inhibitor program in cancer-associated thrombosis. Your immediate task is to deliver one high-fidelity clinical concept set that will be embedded in a validated, incident CAT cohort. The concept set must support high-PPV identification of acute proximal lower-extremity deep-vein thrombosis (DVT) events in adults with active malignancy.

Data environment. Multi-site administrative claims and EHR datasets standardized to the OMOP Common Data Model (CDM).

Key epidemiological parameters (study design scaffolding).

* Target population (restriction): Adults (≥18y) with active cancer (recent diagnosis, metastatic disease, and/or ongoing systemic therapy/radiotherapy/cancer surgery within prespecified windows).
* Index anchoring (phenotype logic): Incident acute VTE with T0 = latest of objective confirmation (compression ultrasound or CTPA/V/Q), VTE diagnosis, and therapeutic-intensity anticoagulation, all within ±7 days of each other.
* Observation time (look-back): ≥365 days prior to T0; no minimum post-index requirement to avoid immortal time.
* Event nature: Incident (new) proximal LE DVT and/or PE; include incidental (unsuspected) proximal events if treated; exclude pregnancy-related VTE at the cohort level.
* Care setting safeguard: Prefer inpatient/ED contexts or repeated outpatient diagnoses (≥7-day separation) when used by the phenotype.
* Event collapsing / exits: Single earliest qualifying entry per person; cohort exit at end of observation.

Structured research question (OHDSI “madlibs”). “Among adults with active malignancy and incident, objectively confirmed VTE initiating therapeutic-intensity anticoagulation, what is the 0–30, 31–180, and 181–365 day incidence of ISTH major bleeding, CRNMB, recurrent VTE, overall and stratified by GI/GU/hepatobiliary tumor sites, metastatic status, and anti-angiogenic/ICI exposure?”

Study contexts selected (to support the phenotype):

1. Clinical characterization / outcome incidence of bleeding and recurrence under current SOC (including post-6-month extended phase).
2. Extended-phase effectiveness/safety among those continuing therapy (contextualizing reduced-dose apixaban practice).

Concept Set Challenge (singular, to be developed now): “Acute Proximal Lower-Extremity Deep-Vein Thrombosis (LE-DVT)—incident event.” (A separate concept set for Pulmonary Embolism will be built in a later iteration; upper-extremity DVT will be excluded for trial comparability.)

---

## Part 2: Structured Clinical Specification (for the Concept Set)

### 1. Core Clinical Definition

Case definition (clinical). An acute thrombus in the proximal deep veins of the lower extremity—popliteal, femoral (common/superficial), deep femoral, iliac, or inferior vena cava segments—presenting symptomatically (e.g., unilateral leg swelling/pain) or incidentally on imaging in a patient with active malignancy. The event is new/incident, proximal (not isolated calf), and treated with therapeutic-intensity anticoagulation per contemporary practice.

Diagnostic criteria (objective confirmation).

* Compression duplex ultrasound documenting non-compressibility/intraluminal thrombus in proximal segments; or
* CT/MR venography confirming proximal LE thrombus. (Imaging evidence is captured by procedure codes in the phenotype but not embedded inside this condition concept set.)

Presentation & course (typical). Acute onset limb swelling, pain, warmth; occasionally asymptomatic if discovered during cancer imaging. Risk of extension/embolization without treatment.

Synonyms / closely related terms (include for search intent but constrain to proximal site). Proximal LE DVT; iliofemoral DVT; femoral vein thrombosis; popliteal vein thrombosis; iliac vein thrombosis; lower-limb DVT (proximal); deep venous thrombosis of lower limb—proximal.

Differential diagnoses (Conditions to be distinguished and not considered inclusive). Isolated distal calf DVT (peroneal/posterior/anterior tibial, muscular veins), superficial thrombophlebitis, chronic post-thrombotic changes, lymphedema/venous insufficiency, cellulitis, Baker cyst.

Common treatments/management (positive proxies). Therapeutic-intensity DOACs (apixaban/rivaroxaban/edoxaban) or LMWH, less commonly VKA; in select cases thrombectomy/thrombolysis/IVC filter. (Treatment will be enforced by phenotype logic; do not add drug codes to this condition concept set.)

---

### 2. Scope Boundaries and Exclusions

In scope (must include).

* Acute DVT of proximal lower-extremity segments (popliteal or above), any laterality, including iliofemoral/IIVC extension.
* Terms explicitly indicating acute or current proximal DVT.

**Not in scope:** The following related clinical ideas are not inclusive.

* Isolated distal calf DVT (peroneal, tibial, soleal/gastrocnemius) without proximal involvement.
* Upper-extremity DVT (subclavian/axillary/jugular) and catheter-related UEDVT.
* Superficial vein thrombosis (e.g., great saphenous).
* “History of DVT,” “chronic DVT,” “sequela of DVT,” “personal history of VTE,” “rule-out/suspected” only.
* Pulmonary embolism codes (handled by a separate PE concept set).
* Pregnancy-related VTE codes (handled at phenotype level; do not include here).

---

### 3. Temporal Context (Crucial)

Temporality requirement. Incident, acute events only.

Impact on code selection.

* Include codes that clearly denote acute/current proximal DVT of the lower extremity.
* Exclude “history of,” “chronic,” “sequela,” “status/post,” and non-acute follow-up terms.
* Exclude ambiguous “venous thrombosis, unspecified site” unless explicitly mapped to proximal lower-extremity. (Final incident status will be enforced by the phenotype via 365-day look-back and prior-therapy washouts; do not encode washouts inside the concept set.)

---

### 4. Clinical Granularity & Use-Case Requirements

Severity/acuity. Acute events only; no explicit severity (e.g., iliofemoral phlegmasia) restrictions inside the concept set.

Etiology. Any etiology (cancer-associated, catheter-associated in lower limb, postoperative), provided location is proximal LE.

Sensitivity/specificity trade-off (for this use case). Prioritize PPV:

* Prefer site-specific proximal terms over generic “DVT of lower extremity, unspecified site.”
* Exclude chronic/history terms even if they mention proximal veins.
* Allow laterality-unspecified proximal terms if they clearly indicate proximal LE location.

---

### 5. Population & Data Context

Target population subgroups (handled by study/phenotype, not the concept set). Adults with active malignancy; high-value strata include GI/GU/hepatobiliary cancers, pancreatic/gastric, urothelial/RCC, hematologic malignancies, metastatic disease, anti-angiogenic/ICI exposure, and thrombocytopenia.