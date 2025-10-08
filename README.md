# The "Minds Meet Machines" (MMM) Initiative

*A Quality Improvement Project Evaluating Human and AI Workflows for OHDSI Concept Set Development.*

**Date:** October 9, 2025 **Time:** 8:00 AM \- 12:00 PM EDT **Location:** OHDSI Symposium, New Brunswick, NJ (and Virtual) **Sponsors:** Johns Hopkins University (JHU); OHDSI Community. **Principal Investigators:** Christopher Mecoli, MD (JHU); Gowtham A Rao, MD, PhD (OHDSI).

[OHDSI Forums discussion](https://forums.ohdsi.org/t/confirmed-hyrbid-and-in-person-ohdsi-symposium-2025-phenotype-development-and-evaluation-work-group-call-for-collaboration-collaborative-intelligence-humans-and-ai-in-concept-set-development-in-phenotyping/24349)

## Overview

The MMM Initiative is a structured Quality Improvement (QI) project designed to evaluate and improve the internal OHDSI methodologies for phenotype development. We are utilizing mixed methods (quantitative and qualitative) to compare the performance (accuracy, completeness, and efficiency) of rigorous, human-led workflows against Generative AI (GenAI)-driven approaches for translating standardized clinical descriptions into concept sets.

## Project Aims

1. **Primary:** Evaluate the performance of GenAI-driven approaches compared to human-led workflows.  
2. **Secondary:** Quantify inter-human variability (Consensus Gain) and conduct a qualitative analysis of human reasoning and collaboration processes to identify best practices.

## Participation Requirements

This project is classified as a QI initiative and involves minimal risk. Participation is voluntary; however, the methodology involves structured workflow assignments, randomization, and systematic data collection.

### \!\! IMPORTANT: Recording and Consent \!\!

* **Informed Consent & Media Release (Mandatory):** All participants must complete the Informed Consent and Media Release form prior to participation.  
* **Audio/Video Recording and Public Release (Mandatory):** To study collaboration and decision-making (Aim 2), all human team deliberations will be audio- and video-recorded. These recordings will be analyzed and **shared publicly** (e.g., YouTube, OHDSI website) to disseminate findings. Agreement to be recorded and publicly released is required to participate.

### Procedures

* **Expertise Survey:** Participants will complete a data collection form to self-identify their expertise in Clinical and Informatics/Tooling domains.  
* **Stratified Randomization:** Survey responses (de-identified after assignment) will be used to assign participants to balanced teams and specific medical conditions, ensuring a mix of expertise.  
* **Tool Restrictions:** Participants assigned to the Human Workflow are **strictly prohibited** from using GenAI tools (e.g., ChatGPT) during the concept set generation task.

## Methodology

The project utilizes a paired design across three main phases:

### Phase 1: Concept Set Generation

* **Human Workflow (Current Practice):** Teams utilize a "Split and Reconcile" model (Modified Delphi). Sub-teams independently create concept sets using standard OHDSI tools (e.g., ATLAS), and then reconvene to agree on a final, reconciled list.  
* **GenAI Workflows (Alternative):** Autonomous generation of concept sets by multiple distinct GenAI pipelines. (AI Submissions are due by October 8th, 2025, 6:00 PM EST). "Human-in-the-loop" or post-editing of AI output is prohibited.

### Phase 2: Analysis and Adjudication

* **The Delta:** All generated concept sets (Human and AI) are resolved. Concepts where any disagreement exists are compiled for manual adjudication.  
* **Blinded Adjudication:** Clinical experts (Adjudicators) will review the Delta to establish a True Gold Standard (TGS). Adjudicators are strictly masked to the source (Human vs. AI) of each concept. The review is prioritized by disagreement level and concept prevalence.  
* **Analysis:** The primary outcome measure is the Prevalence-Weighted F1 Score against the TGS.

## Prerequisites for Participants

1. **Bring Your Laptop:** Essential for accessing the workshop's dedicated ATLAS environment.  
2. **Review Materials:** The target phenotypes and standardized clinical descriptions are available here: [ohdsi-studies/MindMeetsMachines](https://github.com/ohdsi-studies/MindMeetsMachines). Please review these before the event.  
3. **Vocabulary Standardization:** All workflows will utilize the standardized OMOP Vocabulary version released [August 27th 2025](https://github.com/OHDSI/Vocabulary-v5.0/releases/tag/v20250827_1756288395.000000).

## Agenda (October 9th)

* **8:00 AM \- 8:30 AM: Welcome and Logistics**  
  * Introduction to the QI Project objectives and procedures.  
  * Informed Consent Administration.  
  * Expertise Survey completion and Stratified Randomization (Team Assignment).  
* **8:30 AM \- 9:30 AM: Phase 1 \- Human Concept Set Creation**  
  * "Split and Reconcile" process begins. (**Note:** Deliberations will be audio- and video-recorded).  
  * 9:45 AM: Pencils Down (ATLAS instance locked).  
* **9:45 AM \- 10:15 AM: AI Presentations**  
  * Coffee break and short presentations from AI methodology leads.  
  * (Backend: Technical team extracts human concept sets, merges with AI sets, blinds sources, and generates the adjudication lists).  
* **10:15 AM \- 11:30 AM: Phase 2 \- Blinded Adjudication and reflection**  
  * Designated Clinical Experts lead the adjudication of "The Delta" to establish the TGS.  
* **11:30 AM \- 12:00 PM: Wrap-up and The Reveal**  
  * Adjudication stops.  
  * Presentation and discussion of preliminary results (e.g., F1 scores, prevalence-weighted overlap metrics).
