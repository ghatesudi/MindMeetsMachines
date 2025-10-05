# [C05 Ovarian Cancer](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C05)

Our objective is to define a concept set representing active, primary epithelial carcinoma of the ovary, fallopian tube, or peritoneum. This set must capture a confirmed diagnosis of malignant disease, not a history of it or a borderline condition. It will serve as the foundational disease definition for subsequent phenotype algorithms used in comparative effectiveness and health outcomes research focused on women with relapsed or refractory disease, ensuring we begin with a high-fidelity patient population.

**Clinical case definition:**  Primary epithelial malignancy originating in the ovary, fallopian tube, or primary peritoneum. Predominant histology is high-grade serous carcinoma; other epithelial subtypes include low-grade serous, endometrioid, clear cell, mucinous, malignant Brenner (transitional), squamous, and carcinosarcoma (MMMT) when primary to these anatomic sites.

**Diagnostic Criteria**

* Tissue diagnosis from cytoreductive surgery or biopsy confirming epithelial carcinoma of ovary/tube/peritoneum.  
* Imaging supportive of pelvic/adnexal mass and peritoneal disease; CA-125 commonly elevated but not specific.  
* In routine data, diagnosis is represented via oncology malignant neoplasm codes mapped to SNOMED; histology specificity varies by site.

**Presentation & Course (typical).**

* Often presents with abdominal distension, ascites, or pelvic mass; frequent peritoneal spread.  
* Relapse is common after platinum-taxane; subsequent studies apply phenotype logic (PFI ≤6 months) to classify PROC.

**Differential Diagnoses**

* Non-epithelial ovarian tumors: germ-cell (e.g., dysgerminoma, yolk sac), sex-cord stromal (e.g., granulosa cell, Sertoli-Leydig).  
* Borderline (low malignant potential) epithelial tumors.  
* Metastatic carcinoma to ovary (e.g., Krukenberg from GI) or secondary peritoneal carcinomatosis from non-gynecologic primaries.  
* History of ovarian cancer without current active disease.

**Common Treatments/Management (signals the disease exists; not for concept set logic).** Primary cytoreductive surgery; 1L platinum-taxane ± bevacizumab; maintenance PARP in appropriate patients; subsequent non-platinum regimens ± bevacizumab; FRα-targeted ADC for FRα-high; IO/targeted regimens in trials/practice.  
**Clinical Scope**

* **Disease entity**: The scope is primary epithelial malignancy originating in the ovary, fallopian tube, or peritoneum. This includes all major epithelial histologies: high-grade serous, low-grade serous, endometrioid, clear cell, mucinous, malignant Brenner tumors, and carcinosarcoma (MMMT) when primary to these sites. Diagnosis is typically confirmed via tissue pathology.  
* **Temporality**: The scope is restricted to current, active malignant disease.  
* **Severity & acuity**: All stages and grades of invasive epithelial carcinoma are included.  
* **Etiology**: Only primary malignancies of the ovary, fallopian tube, or peritoneum are in scope.

**Related, differential conditions or comorbidities that are not sufficient for inclusion**

* Non-epithelial ovarian tumors, such as germ-cell tumors (e.g., dysgerminoma) or sex-cord stromal tumors (e.g., granulosa cell).  
* Borderline or low malignant potential epithelial tumors of the ovary.  
* Secondary malignant neoplasms metastatic to the ovary or peritoneum from other primary sites, such as gastrointestinal primaries (Krukenberg tumors).

**Synonyms**

* Epithelial ovarian cancer  
* Ovarian carcinoma  
* Fallopian tube carcinoma  
* Primary peritoneal carcinoma  
* High-grade serous ovarian carcinoma (HGSOC)  
* Ovarian carcinosarcoma  
* malignant Brenner tumor (ovary)