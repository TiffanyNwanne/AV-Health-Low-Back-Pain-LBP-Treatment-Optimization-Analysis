# AV Health Low Back Pain (LBP) Treatment Optimization Analysis

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

---

### **Executive Summary**

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Dashboard.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Dashboard.png)

Findings show an average approval time of approximately 2.3 days (2 days, 7 hours, and 5 minutes), with 19% of requests ultimately denied. The presence of prior conservative care was a significant determinant of approval: patients with such care were 50% more likely to be approved compared to those without it. This trend aligns with clinical expectations and highlights the importance of care sequencing in the review process.

Procedure-specific analysis revealed that while MRI/lumbar spine requests made up the largest share of cases (41%), spinal fusion procedures—though less common (9%)—had the longest average approval time at 2.6 days. In contrast, laminectomies had the shortest average approval time of 1.98 days. Age patterns also emerged, with patients around 55 years showing the highest likelihood of having had conservative care, while those near 35 and 65 were least likely.


---

### Insights
The analysis was performed using [SQL](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Patient%20Request%20Queries.sql) and [Python](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Utilization-Analysis/blob/main/Machine%20Learning.ipynb) was used to train a model used for predictive analytics.


**1. What is the average time to approval?**

The average time to approval is 2.295 days, which equates to approximately 2 days, 7 hours, and 5 minutes.

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/1.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/1.png)


2. What percentage of cases were denied?

19% of all prior authorization requests were denied.
[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/2.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/2.png)

3. How does approval time vary by procedure code or provider type?

By Procedure Code:

Spinal Fusion: Longest approval time – 2.60 days.

Laminectomy: Shortest approval time – 1.98 days.

MRI/Lumbar Spine and Spinal Injections fall between these extremes, with exact times not listed but faster than spinal fusion.

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/3.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/3.png)


By Provider Type:

Neurosurgery: Longest approval time – 2.4917 days.

Primary Care: Shortest approval time – 2.1488 days.

Pain Management and Orthopedic providers have intermediate approval times.

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/3b.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/3b.png)

4. What percentage of patients received conservative care prior to the requested procedure?
The exact percentage isn't explicitly stated across the entire population, but the graph shows:

60% of cases where patients had prior conservative care.

40% of cases where patients did not have prior conservative care.

This suggests that approximately 60% of patients received conservative care prior to their procedure requests.

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/4.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/4.png)

5. Are patients without conservative care more likely to be denied?
Yes.

Patients without prior conservative care had a denial rate of 15% (6% denied out of 40% total).

Patients with conservative care had a lower denial rate of 13% (13% denied out of 60% total).

This indicates that patients without conservative care were over 3 times more likely to be denied (15% vs. 5% of total approved), reinforcing the importance of following conservative treatment pathways prior to authorization requests.

[![Preview Image](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/5.png)](https://github.com/TiffanyNwanne/AV-Health-Low-Back-Pain-LBP-Treatment-Optimization-Analysis/blob/main/images/5.png)



---

### **Answers to Stakeholder Questions**

| **Question** | **Answer** |
| --- | --- |
| Average time to approval? | 2 days, 7 hours, 5 minutes |
| What % of cases were denied? | 19% |
| Approval time by procedure/provider? | Spinal fusion = longest; Laminectomy = shortest; MRI = 41% of all procedures |
| % with prior conservative care? | 40% |
| Is conservative care linked to approvals? | Yes – 48% of approved had conservative care; 3x denial risk without it |


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
