# Honda Service Center: Revenue Recovery & Operational Strategy 
### 📊 SQL-Based Financial Audit & Capacity Optimization

**Author:** Alejandro Diaz  
**Role:** Strategic Data Analyst  
**Status:** Open for Hire (Remote)

---

## 🚀 Executive Summary (The "So What?")
Upon analyzing 4 years of historical data (**12,286 service records**) for a Honda Dealership, I identified a critical **Data Gap** affecting 40% of the unique customer base. This gap represents a **Revenue Leakage Risk of ~$3.3M MXN ($165k USD)** in uncaptured retention services.

Furthermore, operational analysis revealed a **"Dead Rent" phenomenon**, where the afternoon shift accounts for 50% of fixed costs but contributes less than 10% of daily volume.

This repository contains the **SQL source code** used to diagnose these issues and generate an immediate "Hot Lead" list for revenue recovery.

---

## 💰 Key Business Findings

### 1. Revenue Leakage (The $3.3M Problem)
* **Insight:** 1,576 unique customers (40% of the base) are "Ghost Clients"—they have no registered phone number.
* **Impact:** Zero contactability for service reminders. Assuming a conservative ticket of **$2,095 MXN ($105 USD)**, the potential revenue at risk is **$3.3 Million MXN**.
* **Immediate Action:** Defined a "Hard Constraint" logic for CRM capture to stop the bleeding.

### 2. Operational Capacity ("Dead Rent")
* **Insight:** The workshop operates at **High Saturation** before 12:00 PM but drops to **<10% utilization** in the afternoon.
* **Financial Risk:** With an estimated monthly rent of **$32,500 USD**, the afternoon shift is consuming resources without generating revenue.
* **Opportunity:** Move "Express Services" to afternoon slots to balance the load.

### 3. Product Mix & Risk Concentration (Pareto)
* **Insight:** The data revealed that **CR-V and HR-V** models account for the majority of the volume.
* **Critical Vulnerability:** The "Ghost Client" issue is most severe in these SUV segments, which typically have a **35% higher average ticket** than compact cars. We are losing contact with our most valuable customers.

---

## 🛠️ Repository Structure (The Technical Strategy)

This project moves from data profiling to actionable financial logic using **PostgreSQL**.

| File | Description | Business Logic |
| :--- | :--- | :--- |
| **`00_database_setup.sql`** | Data Profiling & Sanity Checks | Establishing the universe of analysis (12k+ records, 4-year scope). |
| **`01_capture_audit.sql`** | **Revenue Leakage Audit** | Uses `FILTER` and `::numeric` casting to calculate the exact financial loss per advisor due to missing data. |
| **`02_operational_capacity.sql`** | **Dead Rent Analysis** | Uses `CASE WHEN` and CTEs to segment "Morning vs. Afternoon" shifts and calculate the cost of idle capacity. |
| **`03_product_mix_analysis.sql`** | **Market Fit (Pareto)** | Identifies the "Star Models" (CR-V & HR-V) that drive the business using `RANK()` and aggregation. |
| **`04_strategic_retention.sql`** | **The "Money" List** | Generates a targeted list of high-value customers (CR-V/HR-V) inactive for >180 days for immediate sales recovery. |

---

## ⚖️ Strategic Trade-offs Detected

As a Business Analyst, I identified operational friction points that require management decisions:

1.  **Volume vs. Personalization:** Advisors processing >15 cars/day sacrifice upselling opportunities. *Recommendation: Cap morning appointments.*
2.  **Agility vs. Data Quality:** The use of "Free Text" fields speeds up reception but kills analytics. *Recommendation: Implement standard service codes.*
3.  **Digital vs. Manual:** While Repair Orders are created perfectly (admin side), CRM data is neglected. *Recommendation: Link advisor bonuses to Contactability Rates (>90%).*

---

## 💻 Technical Stack
* **SQL (PostgreSQL):** Advanced aggregation, Window Functions, CTEs, Financial Modeling.
* **Business Intelligence:** KPI Definition (Churn, Leakage, Utilization Rate).
* **Data Cleaning:** Handling `NULL` values and normalizing text strings (`ILIKE`).

---

*"I don't just query data; I find the money hidden in the rows."*