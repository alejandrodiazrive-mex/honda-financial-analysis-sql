Honda Service Center: Operational Efficiency & Revenue Recovery Analysis
📊 SQL-Based Financial Audit & Capacity Optimization
Author: Alejandro Diaz Role: Data Analyst | Business Intelligence Focus Location: Mexico (Open for Remote Work)

🚀 Executive Summary
This project analyzes 4 years of historical service data (12,286 records) from a Honda Dealership to identify operational inefficiencies and revenue leakage.

The analysis reveals that 35% of the customer base lacks valid contact information, creating a significant barrier to retention. Through financial modeling, I estimated a total revenue exposure of ~$526k USD.

Using a scenario-based approach, this repository provides a SQL-driven strategy to potentially recover $79k USD (Realistic Scenario) by optimizing data capture and repurposing underutilized afternoon shifts.

🛡️ Data Quality Audit & Constraints
Before the financial analysis, a rigorous data integrity check was performed (see 00_data_quality_checks.sql).

Audit Check,Status,Impact / Decision
Temporal Consistency,✅ Pass,0 records found outside the analysis scope (2022-2026).
Negative Billable Hours,⚠️ Minor Warning,3 records found with <= 0 hours. Excluded from financial sums.
Invalid Phone Formats,❌ High Risk,"498 records identified with invalid lengths (<10 digits), in addition to NULL values. Included in Revenue Leakage calculation."
Duplicate Candidates,ℹ️ Constraint,"Several advisors show multiple same-model entries per day (e.g., Advisor S. Salas, 3 CR-Vs, Aug 15). Decision: Due to lack of VIN/License Plate ID, these are treated as distinct valid services to avoid under-reporting operational volume."

💰 Financial Impact & Recovery Scenarios
Instead of assuming a total loss, I modeled three recovery scenarios based on a standard ticket of $120 USD applied to the 4,385 contactable-at-risk clients.

Scenario,Recovery Rate,Estimated Revenue Recovery (USD)
Pessimistic,5% (Basic Email/SMS),"$26,310.00"
Realistic,15% (Targeted Calls + Promo),"$78,930.00"
Optimistic,30% (Aggressive Retention Strategy),"$157,860.00"

Note: Projections are based on historical service frequency and standard pricing proxies.

🔑 Key Operational Findings
1. The "Ghost Client" Phenomenon
Insight: 1,576 unique customers have no registered phone number, and another ~500 have invalid numbers.

Impact: The CRM cannot trigger automatic service reminders for these clients, directly increasing churn risk in the CR-V and HR-V segments (our most valuable assets).

2. "Dead Rent" & Capacity Utilization
Insight: The workshop operates at High Saturation before 12:00 PM but drops to <10% utilization in the afternoon.

Financial Risk: Fixed costs (Rent/Staff) remain constant while revenue generation plummets after lunch.

Recommendation: Shift "Express Services" (Oil/Filters) specifically to afternoon slots to balance the daily load.

🛠️ Repository Structure
This project moves from data profiling to actionable financial logic using PostgreSQL.

File,Description,Business Logic
00_data_quality_checks.sql,Data Audit,"Validates data integrity (dates, duplicates, phone formats) before analysis."
01_capture_audit.sql,Leakage Diagnosis,Calculates the exact financial loss per advisor due to missing contact data.
02_operational_capacity.sql,Efficiency Analysis,"Segments ""Morning vs. Afternoon"" shifts to identify idle capacity (""Dead Rent"")."
03_product_mix_analysis.sql,Market Fit (Pareto),"Identifies the ""Star Models"" (CR-V & HR-V) that drive 80% of revenue."
04_strategic_retention.sql,Actionable List,"Generates a ""Hot Lead"" list of high-value customers inactive for >180 days."
05_scenario_analysis.sql,Financial Modeling,"Projects revenue recovery under different conversion rates (5%, 15%, 30%)."

⚖️ Proposed Strategic Actions
Based on the data, the following trade-offs are recommended for management review:

Volume vs. Data Quality: Advisors prioritizing speed are skipping data entry.

Action: Link monthly bonuses to a 90% Contactability Rate.

Agility vs. Analytics: The use of "Free Text" fields speeds up reception but hinders analysis.

Action: Implement standard drop-down service codes in the DMS.

Capacity Balancing:

Action: Offer a 10% discount for customers willing to book appointments after 2:00 PM to reduce morning congestion.

💻 Technical Stack
SQL (PostgreSQL): Advanced aggregation, Window Functions (RANK), CTEs, CASE WHEN logic.

Data Cleaning: Handling NULL values, regex for phone validation, and string normalization (ILIKE).

Business Intelligence: KPI Definition (Churn Risk, Revenue Leakage, Utilization Rate).

"Turning raw service logs into actionable business intelligence."