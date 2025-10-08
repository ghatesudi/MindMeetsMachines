## Minds Meet Machines (MMM) Challenge: Comprehensive Methodology and Statistical Analysis Plan

### 1\. Introduction and Rationale

The translation of standardized clinical descriptions into phenotype concept sets is a critical, yet complex and variable, component of observational research. The "Minds Meet Machines" (MMM) Challenge is a Quality Improvement (QI) project designed to rigorously evaluate the performance of emerging Generative AI (GenAI)-driven approaches compared to structured, consensus-based human workflows for this task. The primary goal is to determine if GenAI methodologies can achieve accuracy comparable to rigorous human processes while understanding the inherent variability in both approaches.

### 2\. Study Objectives

**2.1. Primary Objective:** To evaluate the performance (accuracy) of GenAI-driven approaches compared to a rigorous, consensus-based, human-led workflow for the task of translating standardized clinical descriptions into phenotype concept sets, utilizing a dynamically created gold standard.

**2.2. Secondary Objectives:**

1. To characterize the baseline variability and agreement across all independent workflows (Human and AI) prior to adjudication.  
2. To quantify inter-human variability and the improvement gained through the human consensus process (Consensus Gain).  
3. To analyze the clinical impact of disagreements using prevalence-weighted scoring metrics.  
4. To conduct sensitivity analyses based on source vocabularies (e.g., ICD-10-CM).  
5. To conduct a qualitative analysis of human reasoning and consensus-building processes.

### 3\. Experimental Design Overview

**3.1. Study Design:** This is a methodological evaluation utilizing a parallel assignment, multi-arm, comparative experimental design with mixed methods (quantitative and qualitative analysis).

**3.2. Data Structure and Standardization:** The experiment compares the outputs of different methodologies applied to the same 7 standardized clinical ideas. The design is **paired**, meaning all experimental arms process the same inputs. Statistical analysis will account for this pairing to control for variability in difficulty between clinical ideas. The version of the OMOP vocabulary used is standardized across all workflows to the August 27th, 2025 version.

### 4\. Experimental Arms and Procedures

**4.1. Arm 1: Human Workflow (Control/Benchmark)** A rigorous "Split and Reconcile" model is employed to mitigate groupthink and establish a robust human benchmark.

* **Stratified Randomization:** Participants self-report expertise (Clinical and Informatics). Stratified randomization ensures a balanced mix of expertise across teams.  
* **Independent Creation (Phase 1):** For each clinical idea, participants are divided into 2 or more independent sub-teams working in parallel using standard OHDSI tools (ATLAS, PHOEBE). The use of GenAI is prohibited.  
* **Reconciliation:** The sub-teams convene and utilize a Modified Delphi (Delphi-like) method, facilitated by an honest broker, to negotiate a single, finalized concept set.  
* **Data Capture:** Discussions during the creation and reconciliation phases are audio-recorded for qualitative analysis, authorized by informed consent.

**4.2. Arm 2: GenAI Workflows (Intervention)** Multiple distinct GenAI pipelines (denoted as $AI\_1, ..., AI\_K$) participate.

* **Autonomous Execution:** Generation of concept sets must be autonomous.  
* **Constraints:** "Human-in-the-loop" (HITL) intervention, post-editing of the AI-generated output, and sequential prompting (prompting may occur only once) are strictly prohibited.  
* **Submission:** GenAI teams must submit their outputs by October 8th, 2025, 6:00 PM EST, along with documentation of their methodology.

### 5\. Evaluation Strategy and Adjudication

The evaluation focuses exclusively on the accuracy of the resolved concept *list*. The MMM Challenge employs a dynamic, post-hoc "On-the-Fly Adjudication" model to establish the True Gold Standard (TGS).

**5.1. The Adjudication Process and Blinding:**

1. **Pooling:** The union of all concepts generated across all *N* experimental arms is compiled.  
2. **Delta Identification:**  
   * The *Intersection* (Automatic Gold Standard \- AGS): Concepts universally agreed upon.  
   * The *Delta:* Concepts where any disagreement exists.  
3. **Blinded Adjudication:** Adjudicators (Outcomes Assessors) review the Delta, strictly blinded to the source (Human vs. AI) of each concept. To prevent bias, the interface displays only intrinsic concept information (Name, Vocabulary, hierarchy, prevalence) and excludes the "Agreement Level".  
4. **TGS Definition:** The TGS is constructed by combining the AGS plus the concepts from the Delta approved by the blinded adjudicators.  
5. **Conflict Mitigation:** Experts adjudicating a specific domain cannot participate in the concept set creation for that domain.

### 6\. Statistical Analysis Plan (SAP)

The study design necessitates a structured, two-phased approach to the Statistical Analysis Plan (SAP). The analysis first seeks to understand the variability of the inputs (Phase A) and then proceeds to measure the accuracy of the outputs against the TGS (Phase B).

Given the QI context and the sample size (N=7 clinical ideas), the analysis will focus primarily on descriptive comparisons, supplemented by exploratory inferential statistics.

#### 6.1. Phase A: Pre-Adjudication Analysis (Before TGS Creation)

This analysis occurs immediately after Phase 1 (independent creation) and before human reconciliation or adjudication. It utilizes the raw outputs from all independent workflows (all human sub-teams and all AI pipelines) to address Secondary Objective 1\.

**Objective:** To quantify and visualize the similarities and differences across all independent experimental workflows in a blinded manner.

**Statistical Analysis Plan:** All analyses and visualizations will utilize anonymized labels (e.g., Workflow A, Workflow B) to maintain blinding.

**6.1.1. Data Preparation and Structure:**

* A binary concept presence/absence matrix will be constructed (Rows: Union of all concepts; Columns: Independent workflows).  
* This matrix will be annotated with OHDSI network Concept Prevalence (RecordCount).

**6.1.2. Descriptive Set Characteristics (Quantifying Difference):**

* **Set Size:** The total number of concepts included by each workflow. Descriptive statistics (mean, median, range) will be reported.  
* **Uniqueness:** The count and proportion of concepts proposed by only a single workflow.

**6.1.3. Quantitative Similarity Metrics (Quantifying Similarity):**

* **Jaccard Index:** The primary metric for set similarity, defined as the size of the intersection divided by the size of the union of two sets: $J(A, B) \= \\frac{|A \\cap B|}{|A \\cup B|}$.  
* The Jaccard Index will be calculated for every pair of workflows.

**6.1.4. Visualization of Similarity Patterns:**

* **Similarity Heatmap and Clustering:** A heatmap will visualize the pairwise Jaccard Indices. Hierarchical clustering will be applied to identify clusters of workflows that produce similar outputs and identify methodological outliers.  
* **Upset Plot:** An Upset plot will visualize the intersections between the concept sets, quantifying concepts unique to specific workflows and shared by various combinations.

**6.1.5. Concept Agreement Analysis and Clinical Context:**

* **Match Score Distribution:** We will calculate the "Match Score" for each concept (the number of workflows that included the concept). A histogram will visualize the distribution of these scores.  
* **Agreement vs. Prevalence:** A scatter plot visualizing Match Score (Y-axis) vs. Concept Prevalence (X-axis, log scale) will be generated. This identifies clinically significant areas of difference (i.e., high prevalence concepts with low Match Scores).

---

#### 6.2. Phase B: Post-Adjudication Analysis (After TGS Creation)

This analysis occurs after the TGS has been established through blinded adjudication. It compares the performance of the finalized Human Workflow (reconciled output) and the AI pipelines against the TGS to address the Primary Objective and remaining Secondary Objectives.

**6.2.1. Primary Objective Analysis**

* **Primary Outcome Measure:** **Prevalence-Weighted F1 Score ($F1\_W$)**: The harmonic mean of precision and recall against the TGS, weighted by concept prevalence ($V\_i$).  
    
* **Metric Calculation:** We calculate weighted counts for True Positives (WTP), False Positives (WFP), and False Negatives (WFN) relative to the TGS: $WTP \= \\sum\_{i \\in TP} V\_i$ ; $WFP \= \\sum\_{i \\in FP} V\_i$ ; $WFN \= \\sum\_{i \\in FN} V\_i$  
    
  Weighted Precision ($P\_W$) and Weighted Recall ($R\_W$): $P\_W \= \\frac{WTP}{WTP+WFP}$ ; $R\_W \= \\frac{WTP}{WTP+WFN}$  
    
  $F1\_W \= 2 \\cdot \\frac{P\_W \\cdot R\_W}{P\_W \+ R\_W}$  
    
* **Statistical Analysis Plan:**  
    
  * **Descriptive Statistics:** Descriptive statistics (mean, median, SD, range, 95% CI) for the $F1\_W$ (and related metrics: Precision, Recall, weighted/unweighted) will be reported for the Human Workflow (reconciled output) and each AI pipeline.  
  * **Comparative Analysis:** The difference in $F1\_W$ scores between each AI workflow ($AI\_j$) and the Human workflow will be calculated for each clinical idea. Paired differences will be summarized (mean difference, 95% CI of the mean difference).  
  * **Exploratory Inferential Analysis (Paired Comparisons):** Normality of differences will be assessed (Shapiro-Wilk test). A **Paired t-test** (if normal) or **Wilcoxon Signed-Rank Test** (if non-normal) will be used.  
  * **Exploratory Non-Inferiority Assessment:** We will explore if GenAI approaches are non-inferior using a pre-established margin ($\\delta$, e.g., 0.05). Non-inferiority is suggested if the lower bound of the 95% CI for the mean difference is greater than $-\\delta$.  
  * **Multiple Comparisons Adjustment (Exploratory):** If inferential statistics are reported for multiple AI pipelines against the single Human control, **Dunnett's Test** will be used to adjust the CIs.

**6.2.2. Secondary Objectives Analysis**

* **Inter-Human Variability and Consensus Gain (Objective 2):**  
  * *Inter-Human Variability:* Calculate the average pairwise F1 score between all combinations of the *n* independent human sub-teams (using Phase 1 outputs).  
  * *Consensus Gain:* Use a paired test (Wilcoxon or t-test) to compare the F1 scores (vs TGS) of the independent human sub-teams against the F1 score (vs TGS) of the reconciled human output.  
* **Clinical Impact of Disagreements (Objective 3):**  
  * Calculate **Spearman's Rank Correlation Coefficient** between the $F1\_W$ scores and the Unweighted F1 scores. A low correlation indicates that performance is highly sensitive to concept prevalence.  
* **Source Vocabulary Analysis (Objective 4):**  
  * *Sensitivity Analysis:* The primary descriptive analysis will be repeated using the Source Vocabulary F1 Score (calculated against the TGS based on source codes).  
* **Qualitative Analysis of Human Reasoning (Objective 5):**  
  * *Thematic Analysis:* Transcribed audio recordings from the Human Reconciliation and Adjudication phases will be analyzed to identify patterns in reasoning and consensus-building. Transcripts will be independently coded by two researchers, with assessment of inter-coder reliability.

