[C07 Systemic Sclerosis (SSc)](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C07)

### Part 1: Vignette

You are a lead epidemiologist within the Real-World Evidence (RWE) strategy group of a pharmaceutical company. The strategic imperative for 2025-2026 is to support the market access and Health Technology Assessment (HTA) submissions for the novel therapies Nerandomilast targeting the Progressive Pulmonary Fibrosis (PPF) phenotype in patients with Systemic Sclerosis-associated Interstitial Lung Disease (SSc-ILD).

Your objective is to generate robust evidence quantifying the residual unmet need, natural history, and economic burden in patients who progress despite contemporary combination Standard of Care (SOC) (e.g., MMF \+ Nintedanib/Tocilizumab).

**Data Environment:** This research will be executed using large-scale administrative claims and Electronic Health Record (EHR) databases standardized to the OMOP Common Data Model (CDM).

**Key Epidemiological Parameters:** All planned studies rely on the accurate identification of the foundational Systemic Sclerosis (SSc) population. Given the rarity of SSc and the requirement to inform high-value economic models for HTA submissions, the phenotype algorithm must prioritize very high specificity (Positive Predictive Value \[PPV\] \>90%) to minimize misclassification bias.

The target population is **incident** (newly identified in the database). A validated, multi-pathway phenotype algorithm, informed by external literature (e.g., Jamian et al.), has been selected. The Index Date (T0) is anchored on the earliest SSc diagnosis, with a mandatory 365-day washout period to establish incidence and allow for baseline characterization. To achieve the required PPV, the algorithm requires either (A) high diagnostic persistence (≥3 diagnoses starting ≥30 days apart) OR (B) a diagnosis confirmed by highly specific evidence (Rheumatologist visit, targeted treatments, or SSc-specific serology). *The accuracy of this algorithm is fundamentally dependent on the precision of the underlying concept set and its ability to rigorously exclude localized forms and mimics*.

**Structured Research Question:** “Amongst patients with Incident Systemic Sclerosis (High Specificity) who subsequently develop ILD and initiate combination SOC, what is the 24-month incidence of Progression of Pulmonary Fibrosis (PPF)?”

**The concept set challenge is:** **Systemic Sclerosis (SSc)**.

---

### Part 2: The Structured Clinical Specification

This specification defines the requirements for `Systemic Sclerosis (SSc)`.

#### 1\. Core Clinical Definition

* Case Definition: Systemic Sclerosis (SSc), also known as systemic scleroderma, is a complex, chronic autoimmune disorder characterized by three hallmark features: immune dysregulation (autoimmunity and inflammation), microvasculopathy (vascular injury and remodeling), and progressive fibrosis (excessive collagen deposition) affecting the skin and internal organs (e.g., lungs, gastrointestinal tract, heart, kidneys).  
* Diagnostic Criteria: Diagnosis is clinical, often informed by the 2013 ACR/EULAR classification criteria (score ≥9). Key elements include skin thickening proximal to the MCP joints (sufficient criterion), Raynaud’s phenomenon, digital tip lesions, telangiectasias, abnormal nailfold capillaries, pulmonary arterial hypertension (PAH) and/or interstitial lung disease (ILD), and SSc-specific autoantibodies (Anti-Scl-70/Topoisomerase I, Anti-centromere, Anti-RNA polymerase III).  
* Presentation and Course: The presentation is heterogeneous and the course is chronic and lifelong. It is categorized based on skin involvement:  
  * Diffuse Cutaneous SSc (dcSSc): Extensive skin thickening, higher risk of early ILD and renal crisis.  
  * Limited Cutaneous SSc (lcSSc): Skin thickening restricted distally. Includes CREST syndrome.  
  * SSc sine scleroderma: Internal organ involvement without skin thickening.  
* Synonyms and Closely Related Terms (for search mapping): Systemic Scleroderma, Progressive Systemic Sclerosis (PSS), CREST syndrome (Calcinosis, Raynaud's phenomenon, Esophageal dysmotility, Sclerodactyly, and Telangiectasias).  
* Differential Diagnoses  (Conditions to be distinguished and not considered inclusive): Undifferentiated Connective Tissue Disease (UCTD), Mixed Connective Tissue Disease (MCTD), Isolated Raynaud’s phenomenon, and various scleroderma mimics (see Exclusions).  
* Common Treatments/Management: Management is typically overseen by a Rheumatologist. Treatments include immunosuppression (e.g., Mycophenolate Mofetil, Cyclophosphamide) and targeted therapies for ILD (Nintedanib, Tocilizumab, Rituximab).

#### 2\. Scope Boundaries and Exclusions

* **Not in scope:** The following related clinical ideas are not inclusive \- the phenotype algorithm is attempting to maintain the required high specificity (PPV \>90%):  
  * **Localized Scleroderma (Non-Systemic) (Critical Exclusion):** Morphea (generalized, plaque, guttate), Linear Scleroderma, En coup de sabre.  
  * **Scleroderma Mimics/Fibrosing Conditions:**  
    * Eosinophilic Fasciitis (Shulman's syndrome).  
    * Scleredema (including Scleredema diabeticorum/of Buschke).  
    * Scleromyxedema (Papular mucinosis).  
    * Nephrogenic Systemic Fibrosis (NSF) (Gadolinium-induced fibrosis).  
  * **Induced Scleroderma:** Drug-induced (e.g., Bleomycin, taxanes) or environmentally/occupationally induced (e.g., Silica exposure, Vinyl chloride disease, Toxic oil syndrome).  
  * **Other Conditions:** Chronic Graft-versus-host disease (GVHD) with sclerodermatous features.  
  * **Isolated Findings:** Isolated "Raynaud's phenomenon," "Acrosclerosis," or "Sclerodactyly" without an accompanying systemic diagnosis.  
  * **Ambiguous Connective Tissue Diseases:** Mixed Connective Tissue Disease (MCTD) or Undifferentiated Connective Tissue Disease (UCTD), unless the concept explicitly includes "Systemic Sclerosis".

#### 3\. Temporal Context

* **Temporality Requirement:** Incident (Newly Identified Established Disease).  
* **Impact on Code Selection:** The concept set must identify the established *presence* of the disease. The incidence requirement is operationalized through the phenotype algorithm logic (365-day washout), not by restricting the concept set. As SSc is a chronic, lifelong condition, codes indicating "History of Systemic Sclerosis" are **not** acceptable for inclusion, as they represent the established presence of the disease state in RWD and thus not incident disease. Codes indicating "Rule-out," "Suspected," or "Pending" must also not be included because they do not represent the high specificity requirement.

#### 4\. Clinical Granularity and Use Case Requirements

* **Severity and Acuity:** All severities and acuities are included (acute manifestations and chronic progression).  
* **Etiology:** Must be restricted to autoimmune/idiopathic Systemic Sclerosis. (See Exclusions for induced causes).  
* **Clinical Subtypes:** Must include all recognized systemic subtypes (dcSSc, lcSSc, SSc sine scleroderma).  
* **Overlap Syndromes:** Include overlap syndromes ONLY if SSc is explicitly mentioned (e.g., Sclerodermatomyositis).  
* **Sensitivity/Specificity Trade-off:** This study supports HTA submissions, economic modeling, and natural history characterization for a rare disease. The requirement is for very high specificity (PPV \>90%). **Precision (Specificity) must be prioritized over Recall (Sensitivity)**. The definition must be narrow, and ambiguous codes or those frequently confounded with localized scleroderma must be excluded.

#### 5\. Population and Data Context

* **Population Subgroups:** Primarily affects adults, aligning with the strategic focus on SSc-ILD, though juvenile systemic sclerosis should be included if present in the data.  
* **Data Environment Specifics:** Intended for use in both administrative claims and EHR data standardized to the OMOP CDM. It will be utilized primarily in the `Condition Occurrence` domain.
