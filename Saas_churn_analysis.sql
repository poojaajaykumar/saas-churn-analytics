SELECT COUNT(*) FROM saas_churn;

-- Overall Churn Rate
SELECT 
    ROUND(SUM(churned)*100.0/COUNT(*), 2) AS churn_rate_pct
FROM saas_churn;

-- Churn by Plan
SELECT
    plan_type,
    COUNT(*) AS customers,
    SUM(churned) AS churned_customers,
    ROUND(SUM(churned)*100.0/COUNT(*), 2) AS churn_rate_pct
FROM saas_churn
GROUP BY plan_type
ORDER BY churn_rate_pct DESC;

-- Usage vs Churn
SELECT
    churned,
    ROUND(AVG(avg_monthly_logins),1) AS avg_logins,
    ROUND(AVG(feature_usage_score),1) AS avg_feature_usage
FROM saas_churn
GROUP BY churned;

-- Overall Business Health: Churn + Monthly ARR
SELECT
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate_pct,
    SUM(monthly_revenue) AS total_mrr
FROM saas_churn;

-- ARR LOST DUE TO CHURN
SELECT
    plan_type,
    SUM(monthly_revenue) AS churned_mrr_lost
FROM saas_churn
WHERE churned = 1
GROUP BY plan_type
ORDER BY churned_mrr_lost DESC;

-- Churn by Contract Type (Monthly vs Annual)
SELECT
    contract_type,
    COUNT(*) AS customers,
    SUM(churned) AS churned_customers,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM saas_churn
GROUP BY contract_type
ORDER BY churn_rate_pct DESC;

--  Usage Drop-Off as a Churn Signal
SELECT
    churned,
    ROUND(AVG(avg_monthly_logins), 1) AS avg_logins,
    ROUND(AVG(avg_session_minutes), 1) AS avg_session_minutes,
    ROUND(AVG(feature_usage_score), 1) AS avg_feature_usage
FROM saas_churn
GROUP BY churned;

-- Support Tickets vs Churn
SELECT
    CASE
        WHEN support_ticket_count = 0 THEN 'No Tickets'
        WHEN support_ticket_count BETWEEN 1 AND 2 THEN 'Low Support'
        WHEN support_ticket_count BETWEEN 3 AND 5 THEN 'Medium Support'
        ELSE 'High Support'
    END AS support_segment,
    COUNT(*) AS customers,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM saas_churn
GROUP BY support_segment
ORDER BY churn_rate_pct DESC;

-- High-Risk Customer Profile
ELECT
    customer_id,
    plan_type,
    monthly_revenue,
    avg_monthly_logins,
    feature_usage_score,
    support_ticket_count
FROM saas_churn
WHERE churned = 0
  AND avg_monthly_logins < 5
  AND feature_usage_score < 30
  AND support_ticket_count >= 3
ORDER BY monthly_revenue DESC;
