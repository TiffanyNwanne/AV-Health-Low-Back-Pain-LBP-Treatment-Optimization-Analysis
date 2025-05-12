# AV Health Low Back Pain (LBP) Utilization Analysis

*Improving Prior Authorization Efficiency for Low Back Pain Interventions*

---

### **Project Background**

AV Health collaborates with health plans to optimize the prior authorization process, ensuring alignment with evidence-based clinical guidelines. Low Back Pain (LBP) represents a significant share of prior authorization requests, with many cases involving high-cost interventions—such as MRIs, injections, and surgeries—that may bypass recommended conservative care.

Inappropriate sequencing of treatments and delays in authorization not only inflate healthcare costs but also degrade provider experience and patient outcomes. To improve this process, the current analysis focuses on identifying inefficiencies and providing actionable recommendations for streamlining care pathways.

---

### **Stakeholder Questions & Analysis Objectives**

**Key Stakeholder Questions:**

1. What is the average time to approval?
2. What percentage of cases were denied?
3. How does approval time vary by procedure code or provider type?
4. What percentage of patients received conservative care prior to the requested procedure?
5. Are patients without conservative care more likely to be denied?
6. Can a model be developed to flag high-risk or inappropriate requests?

**Analysis Objectives:**

- Analyze utilization patterns across LBP-related procedures.
- Identify inefficiencies in care pathways, particularly around the premature use of advanced imaging and surgery.
- Develop KPIs and visualization dashboards to monitor approval metrics.
- Build a predictive model to flag potentially inappropriate or high-risk authorization requests.
- Present strategic recommendations to improve authorization outcomes and care quality.

---

### **Executive Summary**

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Dashboard.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Dashboard.png)

This analysis assessed utilization and approval patterns for LBP-related prior authorization requests, focusing on timing, appropriateness of care, and denial drivers. A total of key metrics were evaluated, including time to approval, denial rates, and presence of conservative care.

The predictive model achieved strong performance with an **accuracy of ~82%**, effectively identifying cases likely to be denied. Notably, **requests lacking conservative care were over 3x more likely to be denied**, reinforcing clinical guidelines around care sequencing.

Insights from this analysis are intended to guide the refinement of clinical decision workflows, align provider practices with best evidence, and support real-time decision-making through integrated dashboards and risk scoring.

---

### **Key Insights**
The analysis was performed using [SQL](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Patient%20Request%20Queries.sql) and [Python](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Machine%20Learning.ipynb) was used to train a model used for predictive analytics.

1. **Approval Timing:**
    - Average time to approval: **2 days, 7 hours, 5 minutes**.
    - **Spinal fusion** requests had the longest approval time despite being a smaller fraction of cases.
    - **Laminectomy** cases had the shortest average approval time.
    - **MRI** requests comprised the largest procedural category (**41%**).
2. **Denial Trends:**
    - Overall denial rate: **19%**.
    - **Surgical procedures**, particularly **spinal fusions**, had the highest denial rates.
    - **Neurosurgeons** showed slightly elevated denial rates, potentially reflecting aggressive surgical referrals.
3. **Conservative Care Influence:**
    - Only **40%** of cases had documented prior conservative care.
    - **48% of approved cases had conservative care**, suggesting a positive correlation between conservative management and approval.
    - Cases **without conservative care were over 3x more likely to be denied**.
4. **Predictive Modeling:**
    - **Accuracy**: ~82%
    - **Precision**: ~76%
    - **Recall (Denials)**: ~70%
    - **F1-score**: ~72%
    - The model effectively flags high-risk requests based on conservative care presence, procedure type, and provider behavior and shows that age is the top factor driving denials.
        
[![Preview image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Machine%20Learning.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Machine%20Learning.png)
        

---

### **Answers to Stakeholder Questions**

| **Question** | **Answer** |
| --- | --- |
| Average time to approval? | 2 days, 7 hours, 5 minutes |
| What % of cases were denied? | 19% |
| Approval time by procedure/provider? | Spinal fusion = longest; Laminectomy = shortest; MRI = 41% of all procedures |
| % with prior conservative care? | 40% |
| Is conservative care linked to approvals? | Yes – 48% of approved had conservative care; 3x denial risk without it |
| Can high-risk requests be predicted? | Yes – Model achieves ~82% accuracy and flags denials effectively |

---

### **Recommendations**

1. **Incentivize Conservative Care First:**
    - Strengthen education for providers on the necessity of documenting PT, medication, or other conservative interventions prior to imaging or surgery referrals.
    - Require conservative care documentation as part of prior authorization workflows for high-cost procedures.
2. **Target High-Variability Providers:**
    - Investigate high-denial providers (e.g., neurosurgeons) for targeted feedback or engagement.
    - Consider peer-review or escalation paths for complex surgical requests with high denial rates.
3. **Use Predictive Model in Workflow:**
    - Integrate the predictive model into authorization systems to automatically flag high-risk or inappropriate requests in real time.
    - Provide clinicians with risk scores and denial probability to support transparent, evidence-based decisions.
4. **Monitor with Dashboards:**
    - Implement KPI dashboards tracking approval time, denial rates, and conservative care adherence.
    - Enable dynamic filtering by procedure, provider type, and patient demographics for performance review.
5. **Policy & Communication Improvements:**
    - Streamline communication to reduce unnecessary delays in the authorization process.
    - Offer pre-authorization guidance for commonly denied procedures to reduce rework and friction.
