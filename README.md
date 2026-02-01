-- Project Overview
SaaS Customer Churn Analytics & Prediction

Customer churn is a major growth risk for subscription-based SaaS businesses.
This project analyzes customer behavior and builds a predictive model to identify customers at high risk of churn, enabling proactive retention strategies.

The focus is business decision-making, not just model accuracy.

🎯 Business Problem

A B2B SaaS company is experiencing rising customer churn, impacting Monthly Recurring Revenue (MRR).

Key questions:

Which customers are most likely to churn?

What behavioral signals predict churn early?

How can the business prioritize retention efforts?

🧾 Dataset

5,000+ SaaS customers

Simulated real-world SaaS data including:

Subscription details

Product usage behavior

Support ticket activity

Revenue and tenure

Target variable:
churned (1 = churned, 0 = active)

🛠 Tools & Technologies

Python: pandas, numpy, scikit-learn, matplotlib

SQL (MySQL): exploratory analysis & segmentation

Jupyter Notebook: analysis and modeling

🔍 Analysis Approach
1️⃣ Exploratory Analysis (SQL & Python)

Churn rate by plan type and contract type

Revenue loss due to churn

Relationship between usage, support tickets, and churn

2️⃣ Feature Engineering

Key features used:

Product engagement (logins, session time, feature usage)

Customer friction (support tickets, resolution time)

Tenure and revenue

3️⃣ Predictive Modeling

Model: Logistic Regression (interpretable & business-friendly)

Evaluation Metric: ROC-AUC

Performance: ~0.78 ROC-AUC

4️⃣ Model Explainability

Feature importance analysis identified:

Low product engagement as the strongest churn driver

High support ticket volume significantly increases churn risk

Longer customer tenure reduces churn likelihood

📈 Key Visualization (Executive-Friendly)

Feature Importance Chart
This single chart explains why customers churn and directly supports business action:

Positive impact → higher churn risk

Negative impact → churn protection

💡 Business Insights

Customers with declining engagement are most likely to churn

Support friction is a critical early warning signal

Retention efforts should focus on:

Low-usage, high-ticket customers

High-value customers showing early disengagement

✅ Business Recommendations

Trigger proactive outreach for high-risk customers

Improve onboarding for low-tenure users

Prioritize support quality for churn-prone segments

📌 Resume-Ready Impact

Built an end-to-end churn analytics solution from raw data to prediction

Identified actionable churn drivers using explainable ML

Enabled data-driven retention strategies to protect recurring revenue

🚀 Next Enhancements (Optional)

Cost-based churn threshold optimization

Retention campaign A/B testing

Executive dashboard in Power BI or Tableau

👩‍💻 Author

Pooja
Business Analytics | Marketing & Customer Analytics
