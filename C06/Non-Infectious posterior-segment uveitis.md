# \*\*\[C06 Non-Infectious posterior-segment uveitis\](https://github.com/ohdsi-studies/MindMeetsMachines/tree/main/C06)\*\*

## Part 1: Vignette

You are an epidemiologist at a pharmaceutical company preparing RWD studies to support HTA and market access for novel oral TYK2/JAK-pathway agents for severe uveitis. Your immediate task is to **define a single concept set**—the diagnosis list for **Active, Non-Infectious posterior-segment uveitis (intermediate, posterior, or panuveitis)**—to be used inside cohort definitions that are **treatment-anchored** on systemic therapy.

**Data Environment:** You will work across U.S. claims and EHR assets standardized to the **OMOP Common Data Model**. Example data partners include Optum, MarketScan, Veradigm, IQVIA, and HealthVerity.

**Key Epidemiological Parameters (from the study & phenotype contexts):**

* **Target population:** Prevalent patients with **active** Non-Infectious uveitis involving the **intermediate or posterior segment**, or **panuveitis** (sight-threatening/steroid-dependent/refractory to local therapy).  
    
* **Index anchoring (T0):** First qualifying **systemic** therapy exposure (high-dose systemic corticosteroid or systemic IMT) per episode.  
    
* **Observation requirement:** ≥365 days prior continuous observation; no minimum post-index requirement (avoid immortal time bias).  
    
* **Inclusions/Exclusions at cohort level (not concept-set logic):**  
    
  * Confirm posterior-segment NIU diagnosis **on/before T0**.  
  * Exclude **infectious uveitis** and **masquerade syndromes**.  
  * Permit multiple episodes per person (chronic/recurrent disease).


* **Outcome nature for incidence/characterization studies:** Episode-based, **prevalent active** disease states (not incident disease onset).

**Structured Research Question (OHDSI-style “Madlibs” example):** “Among **patients with ophthalmology-diagnosed posterior-segment Non-Infectious uveitis (intermediate, posterior, or panuveitis)** who **initiate systemic immunomodulatory therapy or high-dose systemic corticosteroids (T0)**, what is the **12- and 18-month** risk of **treatment failure and persistent steroid dependence**, during a **time-at-risk** beginning at **T0**?”

**Concept Set Challenge (singular):** **CS1 — Active Non-Infectious posterior-segment uveitis: intermediate uveitis, posterior uveitis, or panuveitis.**

Purpose: diagnostic confirmation of anatomy/severity context for cohort inclusion; **not** a phenotype algorithm and **not** a treatment code list. Do not encode temporal logic in concept sets as concept sets are only building one concept set that is part of a cohort definition

---

## Part 2: Structured Clinical Specification (for CS1)

### 1\. Core Clinical Definition

**Case definition (clinical idea to be coded):** Inflammation of the uveal tract with **posterior-segment involvement**—**intermediate uveitis**, **posterior uveitis**, or **panuveitis**—that is **Non-Infectious** (autoimmune/autoinflammatory; idiopathic or associated with systemic disease) and **clinically active** at or immediately preceding the systemic-therapy episode.

**Diagnostic criteria (typical elements used by clinicians):**

* Ophthalmic exam consistent with posterior-segment inflammation: vitreous cells/haze, “snowballs/snowbanking” (intermediate), chorioretinitis/retinitis, retinal vasculitis, optic disc edema; activity graded per SUN where available.  
* Imaging supportive when present: OCT (CME), FFA (leakage/vasculitis), ± ICGA/ultrawidefield angiography.  
* Exclusion of infection and masquerade by appropriate work-up (handled in cohort logic, not inside this concept list).

**Presentation and course:** Chronic or recurrent disease with **active** flares; may be sight-threatening; often steroid-responsive but **steroid-dependent** without additional IMT.

**Synonyms & closely related terms:** Intermediate uveitis; pars planitis; posterior uveitis; choroiditis/chorioretinitis (non-infectious); panuveitis; posterior cyclitis; birdshot chorioretinopathy; VKH-associated uveitis; sympathetic ophthalmia; sarcoid uveitis; Behçet-associated posterior uveitis. Named NIU entities classified under posterior-segment/panuveitis (e.g., birdshot chorioretinopathy, VKH-associated uveitis, sympathetic ophthalmia, sarcoid-associated uveitis) when the uveitis is explicit is included.

**Differential diagnoses (Conditions to be distinguished, potentially excluded and not considered inclusive):** Infectious uveitis (e.g., toxoplasma, HSV/VZV/CMV retinitis, TB, syphilis), intraocular lymphoma/other masquerades, isolated anterior uveitis, scleritis/episcleritis, non-inflammatory mimics.

**Common treatments/management (context only):** High-dose systemic corticosteroids; steroid-sparing IMT (methotrexate, mycophenolate, azathioprine, cyclosporine, tacrolimus); biologics (adalimumab). *Therapies are **not** part of this concept set.*

---

### 2\. Scope Boundaries and Exclusions (deterministic rules for code triage)

**Not in scope:** The following related clinical ideas are not inclusive for this specific use case, as they represent distinct clinical entities or lack the required specificity:

* **Anterior-only** uveitis/iritis/iridocyclitis.  
* **Uveitis NOS/unspecified** with **no posterior-segment anatomy** (avoid non-specificity).  
* **Infectious** uveitis entities (toxoplasma, TB, syphilitic, viral retinitis, fungal, parasitic) — handled comprehensively in a **separate exclusion concept set** (CS4) but do **not** include them here.  
* **Masquerade syndromes** (e.g., intraocular lymphoma) — separate exclusion list (CS5); do not include here.  
* **Traumatic or post-procedural** iritis/uveitis.  
* Terms denoting **history of**, **inactive/quiescent**, **sequelae/scar** (e.g., “old chorioretinal scar”) or **remission** status.  
* Complication-only findings without explicit uveitis (e.g., “cystoid macular edema”, “retinal vasculitis” **alone**) unless the concept explicitly encodes uveitis.

---

### 3\. Temporal Context (crucial for how the codes will be used)

* **Temporality requirement for the study:** **Prevalent active** episodes (new flare or persistent activity).  
    
* **Impact on code selection:**  
    
  * **Exclude** ideas that explicitly denote **history/inactive/resolved** states or sequelae/scars.  
  * Otherwise, **do not encode timing** inside the concept list; episode timing is governed by cohort logic (index at systemic therapy).

---

### 4\. Clinical Granularity & Use-Case Requirements

* **Severity/Acuity:** Target **sight-threatening or refractory** disease; the concept list itself is anatomic/etiologic; severity is enforced by phenotype design (systemic-therapy anchoring and CS dose thresholds).  
    
* **Etiology:** **Non-infectious** only. Include idiopathic and autoimmune-associated uveitis **when the uveitis is explicit**; do not include systemic disease codes **without** uveitis.  
    
* **Sensitivity vs. Specificity:** Prioritize **PPV**. Concretely:  
    
  * Favor **anatomically specific** posterior-segment terms and named NIU entities.  
  * **Exclude** non-specific “uveitis NOS” and anterior-only terms to avoid misclassification.  
  * Rely on cohort-level exclusions for infection/masquerade rather than over-pruning CS1.

---

### 5\. Population & Data Context

* **Population subgroups (study-level, not concept-set logic):** May stratify in analyses by age (pediatric/adult/elderly), sex, systemic autoimmune associations (e.g., sarcoid, Behçet), and baseline ocular complications (e.g., CME).  
    
* **Data environment specifics:**  
    
  * **Claims:** Diagnosis specificity varies; reinforce PPV by restricting CS1 to posterior-segment/panuveitis and pairing with cohort-level ophthalmology settings where available (optional sensitivity analysis).  
  * **EHR:** More granular ophthalmic terms may appear; still apply explicit IN/OUT rules above.  
  * **Dose information for corticosteroids** (for phenotype severity rule) may require prednisone-equivalent calculation from RxNorm \+ strength/quantity; this is **outside** CS1.

---

### Practical Inclusion/Exclusion Heuristics for Code Review (deterministic tie-breakers)

**Include if:**

* Concept name contains **“intermediate uveitis,” “pars planitis,” “posterior uveitis,” “panuveitis,” “posterior cyclitis,” “retinochoroiditis/choroiditis”**.  
* Named NIU entities explicitly encoding uveitis under posterior/panuveitis (e.g., **birdshot chorioretinopathy**, **VKH-associated uveitis**, **sympathetic ophthalmia**, **sarcoid uveitis**, **Behçet uveitis**)—**only when the disorder concept includes uveitis**.

**Exclude if:**

* Concept indicates **“anterior,” “iritis,” “iridocyclitis,” “keratouveitis”** limited to anterior, or **“uveitis, unspecified”** without posterior anatomy.  
* Concept indicates **infection** (organism-named or explicitly infectious), **trauma/post-procedural**, **history/inactive/remission**, or **sequela/scar**.  
* Concept is a **sign/complication** without uveitis in the concept (e.g., CME, retinal vasculitis, vitreous hemorrhage).