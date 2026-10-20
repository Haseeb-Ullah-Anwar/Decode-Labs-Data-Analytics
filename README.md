# 📊 E-Commerce Sales Performance & Corporate Diagnostics Audit
**Data Analytics Portfolio Artifact | Decode Labs Internship Track**

---

## 📁 Repository Overview & Architecture
This industrial repository houses the end-to-end data pipeline, data sanitization logs, and advanced Exploratory Data Analysis (EDA) executed on an enterprise E-commerce transactional dataset containing **1,200 unique records**.

The repository is structured into two core processing phases within a unified analytical workbook:
1. `Sanitized Transactions` — Product database acting as a pristine data warehouse and source of truth.
2. `Exploratory Data Analysis` — Executive dashboard incorporating advanced statistical matrices, outlier filtering pipelines, and operational visualizations.

---

## 🧹 Project 1: Enterprise Data Sanitization & Cleaning
Before execution of statistical calculations, the raw dataset underwent a rigorous data audit to eliminate structural anomalies and maximize data integrity across all variables.

### 📝 Change Management & Imputation Matrix
* **CR001 | Transaction Identifier Audit:** Conducted a comprehensive uniqueness search across primary order codes (`OrderID`). Proved a **0% duplication rate**, maintaining record-level structural integrity.
* **CR002 | Strategic Missing Value Imputation:** Detected **309 blank entries** within the `CouponCode` categorical metric. To prevent system errors and capture non-promotional touchpoints, all blanks were imputed with a professional `'NO_COUPON'` string flag.
* **CR003 | Temporal Standardization:** Transformed fragmented, inconsistent system-generated dates into a unified **ISO 8601 string format (`YYYY-MM-DD`)**.
* **CR004 | Numeric Floating-Point Precision:** Standardized financial currency fields (`UnitPrice` and `TotalPrice`) strictly to **2 decimal places** to prevent statistical trailing errors during sum aggregations.

---

## 📉 Project 2: Advanced Exploratory Data Analysis (EDA)
Using the sanitized data baseline, a comprehensive parametric audit was conducted to analyze performance distribution, operational skewness, and high-value revenue streams.

### 📊 Core Descriptive Statistical Fingerprint
* **Total Transaction Volume (N):** 1,200 Valid Customer Orders
* **Mean (Average Gross Sales Size):** \$1,053.97
* **Median (True Operational Center):** \$823.62
* **Standard Deviation (Data Dispersion/Variability):** \$819.86
* **Absolute Minimum Boundary:** \$11.39
* **Absolute Maximum Value:** \$3,456.40

### 🔍 Forensic Outlier Detection (Tukey's IQR Framework)
To objectively separate normal operational variations (Noise) from high-value business opportunities (Signals), the Interquartile Range (IQR) methodology was hardcoded:
* **First Quartile (Q1 - 25th Percentile):** \$410.52
* **Third Quartile (Q3 - 75th Percentile):** \$1,578.48
* **Calculated Interquartile Range (IQR):** \$1,167.96
* **Mathematical Upper Outlier Bound (Q3 + 1.5 × IQR):** **\$3,330.41**

#### 💡 Forensic Interpretation:
The system's maximum transaction of **\$3,456.40** officially breaches the mathematical boundary of \$3,330.41. A deeper conditional filtering audit revealed exactly **8 high-value transactions** exceeding this limit. Per the analytical framework, these 8 anomalies are verified **Positive Business Signals** representing major corporate enterprise/VIP orders rather than manual data corruption errors.

### 🔗 Correlation & Dimension Mapping
* **Pearson Correlation Coefficient (r - Quantity vs TotalPrice):** **`0.61525`**
* *Insight:* A robust, strong positive correlation that mathematically proves bulk transactional quantity density acts as the direct linear driver for top-line gross revenue.
* **Macro Sales Channel Volume (Credit Card):** \$263,847.63
* **Marketing Promotion Reach:** 1,048,267 entries affected by campaign elements.

---

## 🖼️ Visual Evidence & Executive Dashboard Layout
The `Exploratory Data Analysis` matrix utilizes a non-3D flat presentation layout designed specifically for corporate stakeholder alignment:
1. **Histogram (Revenue Skewness Audit):** Confirms a strong **Right-Skewed Distribution** profile. It visually maps that high-frequency retail transactions aggregate under \$1,500, with a thin corporate tail pulling the average upward.
2. **Box-and-Whisker Plot (Outlier Fingerprint):** Confirms the central densed data box and highlights the 8 elite enterprise orders as distinct statistical coordinates outside the outer whisker.
3. **Monthly Revenue Line Chart (Macro Growth Timeline):** Evaluates temporal sales behavior, mapping macro revenue peaks, season adjustments, and stability lines across the entire transactional timeline.

---

## 💾 Project 3: Production SQL Relational Data Architecture
* **Dataset Name:** ECommerce_Data
* **Core SQL Extraction Pipelines:**
  * **Task 01 | Multi-Criteria Channel Funneling:** Implemented declarative filtering combining explicit equalities (`OrderStatus = 'Shipped'` and `PaymentMethod = 'Credit Card'`) to isolate active financial streams.
  * **Task 02 | Categorical Bucket Aggregations:** Hardcoded the standard relational engine optimization logic using `GROUP BY` and multi-level scalar metrics (`COUNT`, `SUM`, `ROUND`) to compress raw rows into clean product business intelligence.
  * **Task 03 | Relational Outlier Validation:** Injected the calculated Project 2 IQR threshold boundary (`TotalPrice > 3330.41`) inside the database pipeline. Successfully extracted the exact **8 high-value corporate enterprise transactions**, validating 100% data consistency across our analytical framework.

### ⚙️ Engine Execution Logic & Architecture
All scripts in the standalone `.sql` repository fully account for the internal compilation structure of standard relational databases, respecting the execution loop: 
`FROM ➡️ WHERE ➡️ GROUP BY ➡️ HAVING ➡️ SELECT ➡️ ORDER BY`

This setup proactively mitigates compile-time bugs like the **"Alias Trap Vulnerability"** (where a select-layer variable is accidentally requested during a step-2 conditional row-filtering process), presenting a robust enterprise-ready query portfolio.
