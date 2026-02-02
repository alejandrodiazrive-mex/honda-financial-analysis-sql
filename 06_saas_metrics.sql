/* SCRIPT: 06_saas_metrics_calculation.sql
OBJECTIVE: Transform activity logs into SaaS North Star Metrics.
NOTE: 'Inactivity' is used as a Churn Proxy due to the lack of explicit cancellation events.
*/

WITH metrics_base AS (
    SELECT 
        car_model AS tier,
        COUNT(*) as total_users,
        -- INACTIVE: No activity in > 90 days (Churn Proxy)
        COUNT(*) FILTER (WHERE appointment_date < CURRENT_DATE - INTERVAL '90 days') as inactive_users_90d,
        -- AT RISK: No activity in 30-90 days (Early Warning Signal)
        COUNT(*) FILTER (WHERE appointment_date BETWEEN CURRENT_DATE - INTERVAL '90 days' AND CURRENT_DATE - INTERVAL '30 days') as at_risk_users_30_90d,
        ROUND(COUNT(*) FILTER (WHERE appointment_date < CURRENT_DATE - INTERVAL '90 days')::numeric / COUNT(*) * 100, 2) as inactivity_rate_pct
    FROM citas_honda
    GROUP BY 1
)
SELECT 
    tier,
    total_users,
    inactive_users_90d,
    at_risk_users_30_90d,
    inactivity_rate_pct || '%' as inactivity_rate,
    -- FINANCIAL IMPACT: Revenue exposure from inactive users
    (inactive_users_90d * CASE 
            WHEN tier ILIKE '%CR-V%' THEN 499 
            WHEN tier ILIKE '%HR-V%' THEN 149 
            ELSE 49 
        END
    ) as revenue_exposure_usd
FROM metrics_base
WHERE total_users > 10 -- Filtering noise
ORDER BY revenue_exposure_usd DESC;