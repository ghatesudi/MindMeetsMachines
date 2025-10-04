# Study Protocol: The "Minds Meet Machines" Challenge

**Created Date:** October 3, 2025 **Version:** 1.0.0

## Section 1: Study Identification

**1.1. Study Title:**

* **Official Title:** A Multi-Arm, Blinded, Comparative Study Evaluating Human Expert versus Generative AI-Driven Workflows for Phenotype Concept Set Selection  
* **Public Title:** The "Minds Meet Machines" (MMM) Challenge: Comparing Human and AI Performance in Selecting Medical Codes for Research.

**1.2. Trial Acronym:** MMM

**1.3. Other Study ID Numbers:**

* **Sponsor-Assigned ID:** OHDSI-GLOBAL-PhenotypeWorkgroup \-20251009

**1.4. Document Control**

* **Version:** 1.0.0 (initial release; no modifications)  
* **Created:** October 3, 2025  
* **Maintainers:** Primary Investigators (PIs): Gowtham A Rao, Azza A Shoaibi

## Section 2: Sponsor & Collaborators

**2.1. Responsible Party:** Azza A Shoaibi, Gowtham A Rao, Observational Health Data Sciences and Informatics (OHDSI)

**2.2. Sponsor:** Observational Health Data Sciences and Informatics (OHDSI)

**2.3. Primary Investigators (PIs):**

* Azza Shoaibi PhD ([shoaibi.azza@gmail.com](mailto:shoaibi.azza@gmail.com))  
* Gowtham A Rao MD, PhD ([rao@ohdsi.org](mailto:rao@ohdsi.org))

**2.5. Scientific advisors:**

* Patrick Ryan PhD ([ryan@ohdsi.org](mailto:ryan@ohdsi.org))  
* Martijn Schuemie PhD ([schuemie@ohdsi.org](mailto:schuemie@ohdsi.org))  
* Jack Murphy PhD ([jackmurphy2351@gmail.com](mailto:jackmurphy2351@gmail.com))

**2.6. Honest Brokers (independent; not members of the PIs’ team)**

* Gaurav **Dravida** ([dravida@ohdsi.org](mailto:dravida@ohdsi.org))  
* Craig Sachson ([sachson@ohdsi.org](mailto:sachson@ohdsi.org))  
* Elisse Katzman ([katzman@ohdsi.org](mailto:katzman@ohdsi.org))  
* On site volunteers

**Role Boundary:** Honest brokers conduct **all human-facing activities** (announcements, inquiries, day-of check-in/enrollment, information notice distribution, grouping, logistics, custody of any optional signed forms, assignment of random IDs, export scrubbing, and delivery of de-identified datasets). The **PIs may support brokers operationally** (e.g., venue coordination, infrastructure readiness, materials preparation) and may engage the broader audience **only in non–individual participant-facing group settings** (e.g., general plenary remarks **after** human-facing activities conclude). PIs **do not** recruit, screen, enroll, or interact with participants individually.

## Section 3: Study Description

**3.1. Brief Summary (Lay Language):** Observational health research requires identifying patients with specific conditions using lists of medical codes (concept sets). Creating these lists is traditionally slow and manual. This study, the "Minds Meet Machines" challenge, is a methodological evaluation comparing the accuracy and completeness of new Generative Artificial Intelligence (GenAI) tools against rigorous, human-led workflows for this task. The evaluation analyzes **only de-identified outputs**; the PIs have **no interaction** with participants.

**3.2. Detailed Description (Rationale and Objectives):** The MMM challenge is designed as a controlled evaluation using **de-identified outputs** to compare GenAI workflows to human-led workflows.

* **Primary Objective:** Evaluate performance (accuracy and completeness) of GenAI approaches vs. a rigorous, consensus-based human workflow for translating standardized clinical descriptions into phenotype concept sets.  
    
* **Secondary Objectives:**  
    
  * Quantify inter-human variability pre-reconciliation (based on de-identified outputs).  
  * Analyze clinical impact with prevalence-weighted metrics.  
  * Conduct a secondary analysis using selected source vocabularies (e.g., ICD-10-CM); primary analysis uses OHDSI standard concepts (e.g., SNOMED).

**3.3. Study Phase:** N/A (Methodological Study)

**3.4. Study Type:** Methodological evaluation of **de-identified outputs** (comparative design evaluating outputs from human-led vs. computer-led methodologies). The PIs analyze **de-identified outputs** provided by independent honest brokers ([**sachson@ohdsi.org**](mailto:sachson@ohdsi.org), [**dravida@ohdsi.org**](mailto:dravida@ohdsi.org)). The PIs do **not** interact with participants and cannot readily ascertain identity. This qualifies as **Not Human Subjects Research (NHSR)**; we will request a formal NHSR determination.

**3.5. Study Purpose:** Health Services Research / Methodological Evaluation.

## Section 4: Study Design

**4.1. Primary Purpose:** Methodological Evaluation

**4.2. Study Model:** Parallel Assignment (multi-arm comparative design; quantitative analysis). The evaluation compares outputs of different methodologies applied to identical standardized inputs across 5–6 disease domains from several candidate domains that will be released in advance to the public.

**4.3. Masking/Blinding:** Single blind (Outcomes Assessor). Adjudicators (PIs’ evaluation team) are strictly blinded to the source (Human vs. AI arm) of each concept. Honest brokers prepare blinded adjudication inputs with **only concept-level attributes** (e.g., name, vocabulary, hierarchy, prevalence). No contributor/team metadata is provided to adjudicators. Brokers compile/deliver the adjudication bundle (or host a read-only app/spreadsheet). Adjudicators never receive contributor identities or underlying source files.

**4.4. Allocation:** Self-selection or broker-managed grouping. Participants self-organize or are grouped solely by brokers using non-identifiable inputs. PIs neither collect characteristics nor assign/randomize participants.

**4.5. Arms and Methodologies:**

| Arm | Arm Description | Methodology | Methodology Description |
| :---- | :---- | :---- | :---- |
| Arm 1: Human Workflow (Control/Benchmark) | "Split and Reconcile" model. Human-led process facilitated by the brokers. Brokers collect final de-identified concept sets and non-identifiable metrics; they transmit blinded outputs to the PIs. The PIs receive no identifiers and no re-identification key. | Participants use standard OHDSI tools (ATLAS, PHOEBE, ATHENA) provided by the brokers. External LLM/GenAI use by the human arm is prohibited. | Independent creation by two voluntary sub-teams followed by a broker-facilitated consensus reconciliation phase. |
| Arm 2: Generative AI Workflows (alternative) | Distinct GenAI pipelines (including anonymous). Outputs are collected and blinded by brokers. | Fully automated GenAI pipeline(s) | Autonomous generation of concept sets using the specified pipelines. **No** HITL or post-edit. **Single-prompt** only (sequential prompting prohibited). |

**Standardized Inputs:** Identical inputs are disseminated **only by the brokers** via OHDSI forum posts and/or broker email broadcasts. PIs do **not** contact participants from study start date till study end date. Inputs consist of a “fully specified” clinical description (clinical context, presentation, inclusion/exclusion criteria, research utility; see appendix). A clinical expert PI may review input content; **brokers** disseminate it.

## Section 5: Outcome Measures

Focus: **accuracy** and **completeness** of each arm’s concept list (structure can be optimized post-hoc).

**5.1. Primary Outcome Measure:**

| Title | Description | Time Frame |
| :---- | :---- | :---- |
| Prevalence-Weighted F1 Score | Harmonic mean of precision/recall vs. the True Gold Standard (TGS); disagreements weighted by concept prevalence across OHDSI network. Analysis uses OHDSI standard concepts (e.g., SNOMED). TGS is established post-hoc via blinded adjudication (Appendix C.1). | Post (2–4 weeks post-workshop) |

**5.2. Secondary Outcome Measures:**

| Title | Description | Time Frame |
| :---- | :---- | :---- |
| Unweighted F1 Score | Standard F1 vs. TGS with equal weighting. | Post |
| Inter-Human Variability | F1 between two human sub-teams before reconciliation (de-identified outputs). | Post |
| Human–GenAI Variability | F1 between reconciled human list and each GenAI list before adjudication. | Post |
| Source Vocabulary F1 | F1 based on selected source codes (e.g., ICD-10-CM) via OHDSI mappings to resolve TGS and generated lists into target source codes. | Post |

## Section 6: Eligibility Criteria (Human Participants)

*Note: Screening/onboarding are conducted **solely** by honest brokers. PIs do not interact with participants.*

**6.1. Sex/Gender:** All

**6.2. Age Limits:** 18+ (adult professionals)

**6.3. Accepts Healthy Volunteers:** Yes (participants are research professionals/experts; no health status assessment).

**6.4. Inclusion Criteria (and Day-of Enrollment Workflow):**

* **Door Greeting & Verbal Agreement:** **Gaurav Dravida** (or designated broker) greets participants at the door, provides the **Information Notice** (Appendix J), and obtains **verbal agreement** to participate.  
* **Optional Written Form (Broker Custody):** Brokers may provide an optional written form. Participants **may** add identifying info and **may** sign; **forms go into a broker-only box**. PIs never see or access these forms.  
* **Random ID Assignment (Broker-Only):** Brokers **draw a random number** and hand it to each participant as their **study ID**. Participants keep this ID and **must use it** in ATLAS and the adjudication/evaluation interface. PIs do **not** know IDs and receive no linkage.  
* **No Linkage Between Paper & ID:** There is **no link** between any identifying info on the optional signed paper (in the box) and the randomly assigned ID.  
* **Replacement IDs:** If a participant **loses/misplaces** an ID **prior to the experiment start**, brokers may issue a **replacement ID**. After start, no replacements are issued.  
* **Pairing Guidance (Split Model):** Brokers may encourage voluntary pairing of a more experienced participant with a less experienced one. Pairing is by self-perception and voluntary.  
* **Adults (≥18 years).**

**6.5. Exclusion Criteria:**

* Inability/unwillingness to proceed after reviewing the Information Notice.  
* Children, prisoners, other vulnerable populations (as screened by brokers).  
* Conflict of Interest: Clinical experts designated as adjudicators (PIs’ evaluation team) for a domain (Phase 2\) are **prohibited** from participating in concept set creation (Phase 1\) for the same domain.

**6.6. Online Participants (MS Teams)**

* **Broker-Hosted Only:** Online participation occurs in a **broker-hosted MS Teams session**.  
* **No Screen Sharing by Participants:** Participants **do not** share screens. This prevents inadvertent disclosure of identities or non-research information.  
* **No PI Contact:** PIs do **not** interact with online participants; any questions are handled by brokers via chat/voice.  
* **Same Rules Apply:** Brokers assign/randomize IDs to online participants and deliver inputs; PIs remain blinded.

## Section 7: Recruitment & Location Information

**7.1. Announcements, Recruitment & Day-of Enrollment Strategy:** Public announcements are issued **in advance** by the honest brokers (e.g., OHDSI forum posts and broker emails) to raise awareness. **All enrollment/check-in occurs on the workshop day—October 9, 2025—and is conducted solely by the brokers.** Any pre-event inquiries or sign-ups (if used) are broker-handled and **not** shared with the PIs. **At no time** do PIs recruit, reply to participant inquiries, screen, or enroll participants during the study period.

**7.2. Study Start Date (Workshop Date):** October 9, 2025

**7.3. Primary Completion Date:** October 31, 2025 (estimated end of adjudication)

**7.4. Study Completion Date:** Data collection (broker-managed) involves only concept sets via OHDSI ATLAS. Brokers ensure no personal identifiers are captured/linked to outputs provided to the PIs. Data collection completes **October 9, 2025**.

**7.5. Locations:**

* Facility: Hyatt Regency, 2 Albany Street, New Brunswick, NJ, 08901  
* **Participant-Facing Supervision:** Brokers supervise all participant spaces. PIs will **not** enter participant rooms/sessions during participant-facing activity.  
* **Contact (Broker Only):** [dravida@ohdsi.org](mailto:dravida@ohdsi.org); other on-site volunteers.  
* **Recruitment (Broker Only):** [dravida@ohdsi.org](mailto:dravida@ohdsi.org); [sachson@ohdsi.org](mailto:sachson@ohdsi.org); other on-site volunteers.

## Section 8: Oversight & Administrative Information

**8.1. IRB/Ethics Committee Approval:** PIs analyze **non-identifiable outputs** provided by **independent honest brokers** (see Appendix H). **All** human-facing procedures (announcements, inquiries, check-in/enrollment, information notice distribution, random ID assignment, logistics, data collection, de-identification) are broker-managed. PIs may support brokers operationally (e.g., infrastructure) and may give **non–participant-facing group remarks** **after** human-facing activities conclude. PIs will **not** be present in participant-facing sessions. PIs will have **no access** to identifiers or any linking key. **No re-identification** will be attempted.

**8.2. Human Subjects Protection Review Board Status:** Pending NHSR Determination.

**8.3. Information Notice:** No informed consent is obtained by the PIs. Brokers provide the Information Notice (Appendix J). Proceeding indicates agreement. Optional signatures, if collected, are **retained solely by brokers** and are **not shared** with PIs.

**8.4. Data Monitoring Committee (DMC):** Not required; methodological minimal-risk; no health or sensitive data shared.

**8.5. Plan to Share IPD (Individual Participant Data):** PIs receive/analyze only **de-identified** data provided by brokers.

* **Allowed:** de-identified concept sets, blinded arm labels, aggregate non-identifiable metrics (e.g., timing/accuracy).  
* **Prohibited:** names, emails, employer/organization, job titles, IP addresses, user logs, and **any open-ended free-text fields**. Brokers scrub ATLAS exports and related files of any user-identifying metadata before transmission.

Concept lists are not attributed to individuals. Brokers submit lists via ATLAS, assign sequential IDs, and provide only these sequential IDs plus de-identified lists to the PIs. No linkage to personal identifiers is possible. Aggregate, de-identified data may later be described in group-level reports.

**8.6. Public Posting (Protocol, Information Notice, De-identified Results):** Public posting will occur at: [**https://github.com/ohdsi-studies/MindMeetsMachines**](https://github.com/ohdsi-studies/MindMeetsMachines) (GitHub repository **managed by the PIs**). Only de-identified materials (as allowed) will be posted.

## Appendices: Detailed Methodology and Procedures

### Appendix A: Experimental Arm Procedures

**A.1. GenAI Arm Procedures**

* **Pre-Workshop Submission:** Brokers send inputs in advance. GenAI outputs \+ methodology documentation are due to **brokers by email** on or before **October 8, 2025** (e.g., [sachson@ohdsi.org](mailto:sachson@ohdsi.org), [dravida@ohdsi.org](mailto:dravida@ohdsi.org)).  
* **Autonomous Execution Requirement:** Execution must be autonomous. **No** HITL or post-editing. **Single-prompt** only.  
* **Verification:** No A/V recording is collected/reviewed by PIs. Verification relies on submitted documentation.

**A.2. Human Arm Procedures (The "Split and Reconcile" Model)**

* **Team Formation & Characterization:**  
    
  * PIs do **not** collect any survey data or participant characteristics.  
  * Allocation: self-selection or broker-managed grouping (Section 4.4).  
  * Bias mitigation: grouping managed by brokers; no PI judgment.


* **Independent Creation:** Two sub-teams (broker-divided) work in parallel in a broker-provisioned ATLAS instance. Use standard OMOP concepts primarily; source codes only in edge cases (not used in primary analysis). **Human arm may not use external LLM/GenAI tools.**  
    
* **Reconciliation:** Broker-facilitated Modified Delphi (Appendix C.3) to produce a single reconciled list.  
    
* **Final Output:** Reconciled list is the official Human Arm output. Brokers enforce naming conventions, attribute sequential team numbers, and mask participant attribution before transfer to PIs.

### Appendix B: Workshop Logistics and Timeline (Broker-Run Activities)

* **Introduction & Standardization (30 min):** Brokers review logistics \+ Information Notice (Appendix J).  
    
* **Phase 1: Human Baseline Generation (60–90 min):** Split-and-Reconcile. Brokers manage timing; ATLAS locked at hard stop.  
    
* **Critical Window (45 min):**  
    
  * **Data Sprint (Broker):** Extract human/AI sets; resolve to standard concepts; **blind** all sets; prepare adjudication bundle.  
  * **Methodology Review (Broker-Hosted):** Optional AI leads’ overview to participants; occurs **after** concept creation; **no PIs present**.


* **Conclusion (15 min):** Brokers close workshop.

### Appendix C: Evaluation Methodology Details (PI Activities)

**C.1. Establishing the Gold Standard (Post-Hoc Adjudication)** Brokers provide the union of all concepts. PIs adjudicate:

* **Intersection:** universally agreed concepts.  
* **Delta:** any concept with disagreement.  
* **Blinded Review:** Brokers present the Delta via app/spreadsheet; PIs have no source identities.  
* **Interface:** Only concept-intrinsic info (name, vocabulary, class/hierarchy, prevalence). **No** “agreement level” shown.  
* **TGS:** Intersection \+ broker-presented Delta approvals.

**C.2. Vocabulary Standardization Strategy** Primary analysis on OHDSI standard concepts (e.g., SNOMED). Secondary analysis (if any) on selected source codes via OHDSI mappings.

**C.3. Consensus Methodology (Modified Delphi)** Broker-facilitated during reconciliation; PIs’ internal discussion during adjudication; final judgment by lead clinical expert.

### Appendix D: Statistical Analysis Plan (SAP)

●     **Primary Analysis:** The primary endpoint is the Prevalence-Weighted F1 score for each arm against the TGS, calculated within the OHDSI standard vocabulary substrate. Descriptive statistics (mean, median, standard deviation, range, 95% Confidence Intervals) will be reported for the Human Arm and each distinct GenAI pipeline across all clinical ideas.

![A close-up of a testAI-generated content may be incorrect.][image1]

![A white background with black textAI-generated content may be incorrect.][image2]

The OHDSI network **prevalence** concept count dataset acts as the weight Wi. The **F1 score** is computed for each arm against the TGS (target group set) within the OHDSI vocabulary.

●     **Hypothesis Testing (Non-Inferiority):** We will test the hypothesis that GenAI approaches are non-inferior to the reconciled Human workflow. A non-inferiority margin will be established *a priori*. Paired t-tests or Wilcoxon signed-rank tests (depending on the distribution of the scores) will be used to compare the performance of each AI arm to the Human arm across the paired clinical ideas.

●     **Inter-Human Variability Analysis:** To address Secondary Objective 1, we will calculate the F1 score between the two independent human sub-teams (Team A vs. Team B) before reconciliation. This will be compared to the F1 score of the reconciled human output vs. the TGS to quantify the improvement gained through the consensus process.

●     **Sensitivity Analysis:** The secondary analysis using source vocabularies (Appendix C.2) will serve as a sensitivity analysis to assess the impact of vocabulary mapping quality on the results.

●     **Subgroup Analysis:** Performance metrics will be analyzed stratified by phenotype/ clinical domain.

### Appendix F: Study Limitations

This study design has several limitations that must be acknowledged: 

●     **The "Missed Concept" Blind Spot:** The on-the-fly adjudication methodology establishes the gold standard based on the union of generated concepts. This design cannot identify or account for concepts that were missed by *all* experimental arms (Human and AI).

●     **Time Constraints:** The execution of the human workflow within a constrained workshop setting may not fully reflect the time typically invested in real-world phenotype development.

●     **Vocabulary Mapping Confounding:** Both the Primary and Secondary analyses are dependent on the quality, completeness, and bi-directionality of the OHDSI vocabulary mappings. Imperfections in the mapping may introduce confounding variables, potentially penalizing an arm (human or AI) for errors inherent in the vocabulary infrastructure rather than the methodology itself.

●     **Generalizability:** The results are specific to the clinical ideas selected, the expertise of the human participants, and the specific GenAI pipelines included. The phenotype selected may not cover the full complexity amd variations of concept set selection of the full spectrum of clinical domains and terms.

●  **Small sample size:** 5 phenotypes may not be sufficient to evaluate the performance gains or losses of GenAi arms. 

●     Expert clinical opinion and adjudication may not be consistent and not an ideal gold standard. 

### Appendix G: Decision Archaeology

(This section summarizes the rationale for key decisions made during the planning phase, based on the peer-review critique.) 

●     **The Structural Proficiency Score (SPS)**

●     *Rejection Rationale:* Accuracy of the final concept *list* is the first-order priority; structure is secondary and can be algorithmically optimized. Additionally, not all AI tools produce OHDSI expressions.

●     **Pre-Curated "Pristine" Gold Standard (A Priori Model)**

●     *Rejection Rationale:* Risk of flawed curation and the "Ceiling Effect" (penalizing the discovery of valid new concepts). Dynamic adjudication was deemed superior.

●     **Single-Team Human Process**

●     *Rejection Rationale:* Susceptible to "groupthink" and insufficiently rigorous. The "Split and Reconcile" model ensures independent work followed by peer review.

●     **Clinical Experts Participating in Concept Generation in their Specialty**

●     *Rejection Rationale:* Conflict of Interest and Bias. Experts cannot participate in construction and then serve as objective adjudicators for the same concept set. A strict separation of duties was mandated.

### Appendix H: Non-Engagement Statement

The PIs are **not engaged** in HSR under 45 CFR 46\. Activities are limited to analysis of de-identified outputs.

1. No PI interaction/intervention with individuals.  
2. Honest brokers conduct all human-facing activities.  
3. PIs receive only de-identified outputs; no identifiers; no key.  
4. No PII/free text/user logs provided to PIs.  
5. Data are coded; key retained by brokers; DUA prohibits release.  
6. No re-identification; purge \+ notify if any identifiers are inadvertently received.

### Appendix I: Data Use Agreement (DUA) Clauses (Bulleted Summary)

(allowed/prohibited scope; no key sharing; no re-ID; security; incident handling; retention/destruction—retained as previously drafted)

### Appendix J: Broker Information Notice (Draft)

To be distributed by brokers. (No signatures collected by PIs; optional signatures, if any, are broker-only and never linked to random IDs.)

**Contacts (Broker Only):** [dravida@ohdsi.org](mailto:dravida@ohdsi.org) | [sachson@ohdsi.org](mailto:sachson@ohdsi.org) **Public Posting (Protocol/Notice/De-identified Results, if allowed):** [https://github.com/ohdsi-studies/MindMeetsMachines](https://github.com/ohdsi-studies/MindMeetsMachines)

[image1]: <data:image/png;base64,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>

[image2]: <data:image/png;base64,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>