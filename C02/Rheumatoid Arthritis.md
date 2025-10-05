### \*\*\[C02 Rheumatoid Arthritis\](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C02)\*\*

### Part 1: Vignette

You are a researcher at a pharmaceutical company developing market access strategies for novel therapies (e.g., PD-1 agonists, VNS, FcRn inhibitors) targeting Difficult-to-Treat Rheumatoid Arthritis (D2T RA). The strategic imperative for 2025-2026 is to quantify the substantial clinical and economic burden of this multi-refractory population (EULAR-defined) to support Health Technology Assessments (HTA) and demonstrate the inadequacy of the current standard of care (cycling existing b/tsDMARDs).

**Data Environment:** This research will be conducted using large-scale administrative claims and Electronic Health Record (EHR) databases, standardized to the OMOP Common Data Model (CDM).

**Key Epidemiological Parameters:** The core of the research relies on a highly specific, high Positive Predictive Value (PPV) phenotype algorithm for D2T RA. This algorithm identifies the incident transition into the D2T state, anchored on the initiation of a 3rd (or greater) line of advanced therapy. It requires ≥365 days of lookback to strictly verify EULAR criteria: failure of ≥2 prior advanced therapies with distinct mechanisms of action (MOA) (each ≥90 days duration), evidence of prior csDMARD use, and evidence of active disease (proxied by concurrent systemic glucocorticoid use).

Crucially, the validity of the entire research agenda hinges on the accurate identification of the foundational population. The D2T RA algorithm depends entirely on a prerequisite cohort: `[C1] Rheumatoid Arthritis (RA), High Specificity`. The concept set you are developing now (\[CS\_RA\_Base\]) is the foundational component of this prerequisite cohort. To meet the rigorous standards required for HTA submissions, this foundational RA definition must prioritize specificity to minimize the misclassification of patients with other inflammatory arthropathies (e.g., Psoriatic Arthritis).

**Structured Research Question (Example):** “Amongst patients who are diagnosed with **\[Rheumatoid Arthritis\]**, what are the patient’s characteristics from their medical history (including demographics, comorbidities, HCRU, and total costs), comparing those meeting criteria for **\[D2T RA (failure of ≥2 b/tsDMARDs with different MOAs and evidence of active disease)\]** versus those who are **\[Non-D2T RA (on 1 b/tsDMARD)\]**?”

**Concept Set Challenge:** \[CS\_RA\_Base\] Rheumatoid Arthritis (Prevalent, High Specificity)

---

### Part 2: The Structured Clinical Specification

This specification defines the requirements for the `[CS_RA_Base] Rheumatoid Arthritis` concept set, which will be used in the Condition domain.

**1\. Core Clinical Definition**

* **Case Definition:** A chronic, systemic autoimmune and inflammatory disease primarily characterized by persistent synovitis of diarthrodial joints, often symmetrical. The disease trajectory involves inflammation of the synovial membrane, leading to potential cartilage destruction, bone erosions, and joint deformity. Systemic features include the production of autoantibodies (Rheumatoid Factor (RF) and anti-citrullinated peptide antibodies (ACPA)).  
* **Diagnostic Criteria:** Diagnosis is based on established clinical criteria (e.g., ACR/EULAR 2010 criteria), which consider the pattern of joint involvement, serology (RF/ACPA), acute phase reactants (ESR/CRP), and duration of symptoms. In RWD, we rely on the clinician's recorded diagnosis based on these criteria.  
* **Presentation and Course:** Presentation typically involves insidious onset of pain, stiffness (especially morning stiffness), and swelling in multiple joints (polyarthritis), commonly affecting the small joints of the hands and feet. The course is typically chronic and progressive without adequate treatment, characterized by flares and potential remission.  
* **Synonyms and Closely Related Terms:**  
  * Rheumatoid polyarthritis  
  * Seropositive/Seronegative rheumatoid arthritis  
  * Felty's syndrome (RA with splenomegaly and neutropenia)  
* **Differential Diagnoses:** (Conditions to be distinguished and not considered inclusive)  
  * Psoriatic Arthritis (PsA)  
  * Ankylosing Spondylitis (AS) and other spondyloarthropathies  
  * Systemic Lupus Erythematosus (SLE)  
  * Gout and Pseudogout (Crystal arthropathies)  
  * Polymyalgia Rheumatica (PMR)  
  * Osteoarthritis (OA)  
  * Juvenile Idiopathic Arthritis (JIA)  
* **Common Treatments/Management:** Conventional synthetic DMARDs (e.g., Methotrexate), biologic DMARDs (e.g., TNF inhibitors), targeted synthetic DMARDs (e.g., JAK inhibitors), systemic glucocorticoids.

**2\. Scope Boundaries and Exclusions**

* **Not in scope:** The following related clinical ideas are not inclusive for this specific use case, as they represent distinct clinical entities or lack the required specificity for the adult D2T pathway analysis:  
  * **Juvenile Arthritis:** All forms of Juvenile Idiopathic Arthritis (JIA), Juvenile Rheumatoid Arthritis, and Still's disease (including Adult-Onset Still's Disease).  
  * **Spondyloarthropathies:** Psoriatic Arthritis, Ankylosing Spondylitis, Reactive Arthritis, Enteropathic Arthritis.  
  * **Other Connective Tissue Diseases (CTDs):** Systemic Lupus Erythematosus (SLE), Scleroderma, Sjögren's syndrome (unless RA is explicitly identified as the co-primary diagnosis/overlap syndrome).  
  * **Crystal Arthropathies:** Gout, Pseudogout/CPPD.  
  * **Polymyalgia Rheumatica (PMR).**  
  * **Non-inflammatory Arthropathies:** Osteoarthritis.  
  * **Non-specific codes:** Arthralgia, Arthritis (unspecified), "Inflammatory arthritis" (unspecified).  
  * **Diagnostic uncertainty:** "Rule-out RA," "Suspected RA."

**3\. Temporal Context**

* **Temporality Requirement:** Prevalent (Established Disease).  
* **Impact on Code Selection:** The concept set must identify patients with an established diagnosis of RA present at or before the index date of the study. As RA is generally considered a lifelong condition, codes indicating "History of RA" are acceptable if they reflect an established, ongoing diagnosis rather than a resolved past event.

**4\. Clinical Granularity and Use Case Requirements**

* **Severity and Acuity:** Must include all levels of severity (mild, moderate, severe) and disease activity (active disease or remission). The downstream D2T RA phenotype algorithm will handle the stratification by current activity (via the glucocorticoid proxy) and treatment history.  
* **Etiology:** Autoimmune inflammatory arthritis.  
* **Presentation:** Must include both Seropositive and Seronegative RA. Must include extra-articular manifestations of RA (e.g., Rheumatoid lung disease, Rheumatoid vasculitis, Felty's syndrome).  
* **Sensitivity/Specificity Trade-off:** This study is for HTA submission and comparative characterization/estimation, requiring **High Positive Predictive Value (PPV)**. Specificity must be prioritized over sensitivity. The goal is to ensure that patients identified truly have RA, minimizing contamination from other arthropathies that utilize similar treatments.

**5\. Population and Data Context**

* **Population Subgroups:** The target population is adults with RA. (The pediatric population is excluded as defined in Section 2).  
* **Data Environment Specifics:** The concept set will be used in both administrative claims and EHR data standardized to the OMOP CDM. The concept set must capture diagnostic information recorded in the `Condition_Occurrence` table.

