# Clinical Description: Incident Venous Thromboembolism (VTE)

**Synonyms:** Deep Vein Thrombosis (DVT), Pulmonary Embolism (PE), Venous Thrombosis, Thromboembolism, Blood Clot (colloquial).

## 1\. Clinical Case Definition

Venous Thromboembolism (VTE) is a vascular condition encompassing Deep Vein Thrombosis (DVT) and Pulmonary Embolism (PE). It occurs when a thrombus (blood clot) forms within the venous system, most commonly in the deep veins of the legs or pelvis (DVT). A PE occurs if the thrombus, or a fragment of it, dislodges and travels (embolizes) to the pulmonary arteries, obstructing blood flow.

The pathogenesis of VTE is often explained by Virchow's triad: venous stasis (e.g., immobilization, surgery), endothelial injury (e.g., trauma, catheters), and a hypercoagulable state (which may be acquired, e.g., due to malignancy or hormonal therapy, or inherited).

The clinical presentation varies significantly. DVT typically presents with unilateral limb edema, pain, warmth, and erythema. PE commonly presents with acute onset dyspnea, pleuritic chest pain, cough, tachycardia, or, in severe cases, syncope and hemodynamic instability (massive PE). A significant proportion of VTE events may be asymptomatic or minimally symptomatic and discovered incidentally during imaging performed for other indications.

Diagnosis requires objective confirmation, as clinical assessment alone is unreliable. Clinical suspicion and risk assessment (e.g., using the Wells' score) guide the diagnostic pathway.

* **DVT:** Compression Ultrasonography (CUS) is the primary diagnostic modality.  
* **PE:** Computed Tomographic Pulmonary Angiography (CTPA) is the standard diagnostic test. Ventilation/Perfusion (V/Q) scanning is an alternative, particularly in patients with contraindications to CTPA (e.g., severe renal impairment or contrast allergy).  
* **Laboratory Tests:** D-dimer testing is often used in the initial assessment; while highly sensitive, it has low specificity. A negative D-dimer can effectively rule out VTE in patients with low or intermediate pre-test probability, but an elevated level mandates further imaging.

This phenotype is intended to capture the acute, objectively confirmed VTE event.

## 2\. Phenotype Scope & Granularity

* **Temporal Context:** Incident (Required). This phenotype targets newly diagnosed, objectively confirmed acute DVT and/or PE events, including both symptomatic and incidental findings.  
* **Severity:** Inclusive of all severities. Clinical distinction between DVT (proximal vs. distal) and PE (e.g., massive, submassive, low-risk) is relevant within this scope.  
* **Acuity / Chronicity:** Acute (Required). The event must represent a new, acute thrombus.  
* **Etiology:** All etiologies (Provoked and Unprovoked/Idiopathic). This scope captures the VTE event regardless of the underlying cause (e.g., secondary to surgery, trauma, immobilization, malignancy, hormonal therapy, or idiopathic).  
* **Population Context:** General Adult Population. This definition is adaptable for application to specific subgroups (e.g., oncology patients, surgical patients, pregnant patients).

## 3\. Related Conditions & Scope Boundaries

The following conditions are related but are not within the scope of this phenotype definition:

* **Arterial Thrombosis:** Conditions such as myocardial infarction, ischemic stroke, or acute limb ischemia (arterial events) are distinct from venous thromboembolism and are not within scope.  
* **Isolated Superficial Vein Thrombosis:** Thrombosis confined solely to the superficial veins (superficial thrombophlebitis), without involvement of the deep venous system, is not within the scope of this DVT/PE phenotype.  
* **Chronic Thromboembolic Disease (without Acute Event):** The presence of chronic thrombi, post-thrombotic changes (e.g., scarring, synechiae), or established Chronic Thromboembolic Pulmonary Hypertension (CTEPH) without evidence of a new, acute VTE event is not within the scope of this incident phenotype.  
* **VTE Mimics:** Conditions causing symptoms similar to DVT or PE, such as cellulitis, lymphedema, ruptured Baker's cyst, musculoskeletal injury, or external vascular compression, are outside the scope unless an acute intraluminal thrombus is objectively confirmed.

## 4\. Key Complications & Common Comorbidities

This section differentiates the core phenotype (the acute VTE event) from its common clinical consequences or associations.

* **Complications:**  
  * Recurrent VTE  
  * Post-Thrombotic Syndrome (PTS) (long-term complication of DVT)  
  * Chronic Thromboembolic Pulmonary Hypertension (CTEPH) (long-term complication of PE)  
  * Bleeding (Major or Clinically Relevant Non-Major, typically secondary to anticoagulation treatment)  
* **Common Comorbidities / Major Provoking Factors:**  
  * Active malignancy  
  * Recent major surgery or trauma  
  * Prolonged immobilization or hospitalization  
  * Inherited or acquired thrombophilias (e.g., Factor V Leiden, Antiphospholipid Syndrome)  
  * Obesity  
  * Estrogen-containing therapies (e.g., oral contraceptives, hormone replacement therapy)  
  * Pregnancy and the postpartum period

## 5\. Intended Data Sources

This clinical description is intended for building concept sets against real-world administrative claims, electronic health record (EHR) databases, and patient registries. The target data should be standardized to the OMOP Common Data Model. Examples of licensable data sources where this concept set would be applied include:

* **Optum®** (Clinformatics® Data Mart, SES, Pan-Therapeutic)  
* **Merative™** (MarketScan® Commercial Claims and Encounters)  
* **Veradigm** (Health Verity, Practice Fusion EHR)  
* **IQVIA** (AmbEMR, PharMetrics Plus)  
* **HealthVerity**

