# LogiTech – Logistics & Warehousing Analytics

<p align="center">
  <strong>Analyze Operational Data to Improve Logistics & Warehousing Efficiency</strong>
</p>

<p align="center">
  End-to-end Data Analytics Capstone Project using Excel, SQL, Python, Power BI, Statistical Analysis and Machine Learning
</p>

---

## 📌 Project Overview

**LogiTech** is an end-to-end data analytics project focused on improving logistics and warehousing efficiency through data-driven analysis.

The project analyzes operational data from **shipments, warehouse operations, and inventory stock movements** to identify inefficiencies, understand cost drivers, improve inventory decisions, validate business relationships, and support better operational decision-making.

The complete analytics workflow follows:

**Data Preparation → Excel → SQL → Python EDA → Power BI → Statistical Analysis → Machine Learning → Business Recommendations**

---

## 🎯 Project Objectives

The project was divided into six major objectives:

### 1. Improve Delivery Reliability & Cost Efficiency
**Tool:** Microsoft Excel

Analyze shipment performance, delivery accuracy, damage rates, carrier performance, delivery modes, and shipment costs.

### 2. Optimize Warehouse Capacity & Operational Efficiency
**Tool:** MySQL / SQL

Analyze warehouse capacity, utilization, labour productivity, fulfilment performance, and pick-pack operations.

### 3. Strengthen Inventory Management
**Tool:** Python

Perform exploratory data analysis on inventory levels, reorder requirements, stockouts, lead time, and carrying costs.

### 4. Maximize Financial Efficiency
**Tool:** Power BI

Analyze shipment costs, operational costs, warehouse performance, utilization, inventory turnover, and cost optimization opportunities.

### 5. Perform Statistical Analysis
**Tool:** Python

Use statistical hypothesis testing and correlation analysis to validate important business relationships.

### 6. Predict Shipment Cost Using Machine Learning
**Tool:** Python / Scikit-learn

Develop regression models to predict shipment cost and compare their performance using MAE, RMSE, and R².

---

## 📊 Dataset Overview

The project uses three operational datasets.

| Dataset | Records | Purpose |
|---|---:|---|
| Shipment Delivery | 209,402 | Delivery performance and shipment cost analysis |
| Warehouse Operations | 19 | Warehouse capacity, utilization and operational analysis |
| Inventory Stock Movement | 2,036 | Inventory, reorder and carrying-cost analysis |
| **Total** | **211,457** | |

> The complete raw datasets are not included in this repository. The repository contains the analysis files, dashboards, notebooks, documentation, and presentation.

---

## 🛠️ Tools & Technologies

### Data Analytics
- Microsoft Excel
- MySQL
- Python
- Power BI

### Python Libraries
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn

### Analysis Environment
- Jupyter Notebook
- Google Colab
- MySQL

---

# 📈 Project Analysis

## 1️⃣ Excel – Delivery Reliability & Cost Efficiency

The Excel analysis focuses on understanding shipment performance and delivery-related costs.

### Key Analysis

- Total shipments
- Total shipment cost
- Average delivery time
- Delivery accuracy rate
- Damage rate
- Average shipment weight
- Carrier performance
- Shipment status distribution
- Delivery mode analysis
- Damage analysis
- Monthly shipment cost trends

### Dashboard Features

- KPI cards
- PivotTables
- Charts
- Slicers
- Interactive filtering

### 📗 Excel Dashboard

[View Excel Dashboard](./excel/LogiTech_Excel_Dashboard.xlsx)

---

## 2️⃣ SQL – Warehouse Operations

SQL was used to analyze warehouse capacity and operational efficiency.

### Key Analysis

- Warehouse capacity
- Warehouse utilization
- Labour productivity
- Fulfilment performance
- Pick and pack operations
- Warehouse-level comparison

### Key Findings

- Warehouse utilization ranged approximately from **51.97% to 82.50%**.
- **PLANT14** recorded the highest utilization at approximately **82.50%**.
- **PLANT16** recorded the highest labour effort at approximately **139 hours/day**.
- **18 warehouses** showed strong fulfilment performance.
- **PLANT08** recorded the lowest fulfilment performance at approximately **82.19%**.

### 🗄️ SQL Analysis

[View SQL Analysis](./sql/warehouse_analysis.sql)

---

## 3️⃣ Python – Inventory Exploratory Data Analysis

Python was used to perform exploratory data analysis on the Inventory Stock Movement dataset.

### Data Quality Checks

- Missing-value analysis
- Duplicate-value analysis
- Negative-value checks
- Data type validation
- Category analysis
- Numerical distribution analysis

### Key Analysis

- Stock-on-hand analysis
- Reorder-level analysis
- Reorder flag analysis
- Stockout analysis
- Lead-time analysis
- Carrying-cost analysis
- Warehouse-level inventory comparison

### Key Findings

- The inventory dataset contains **2,036 records**.
- **21 products** were identified as requiring replenishment.
- **PLANT17** had the highest number of products requiring reorder.
- **PLANT16** had the highest total inventory level.
- Average inventory lead time was **5 days**.
- **PLANT18** recorded the highest carrying cost.

### 🐍 Python Notebooks

- [Inventory EDA](./python/inventory_eda.ipynb)
- [Statistical Analysis](./python/statistical_analysis.ipynb)
- [Shipment Cost Prediction](./python/shipment_cost_prediction.ipynb)

---

# 📊 Statistical Analysis

Four statistical techniques were used to validate important business relationships.

## 1. Independent Sample t-Test

**Purpose:** Determine whether average shipment cost differs significantly between Air and Ground delivery modes.

### Result

- t-statistic = **-143.09**
- p-value = **0.0000**

Since the p-value is below 0.05, the null hypothesis was rejected.

### Conclusion

There is a statistically significant difference in average shipment cost between Air and Ground delivery modes.

---

## 2. Pearson Correlation

**Purpose:** Examine the relationship between warehouse utilization and operational cost.

### Result

- Correlation coefficient = **-0.313**
- p-value = **0.1921**

Since the p-value is above 0.05, the null hypothesis was not rejected.

### Conclusion

Warehouse utilization alone does not show a statistically significant relationship with operational cost in this dataset.

---

## 3. One-Way ANOVA

**Purpose:** Determine whether carrier selection affects shipment cost.

### Result

- F-statistic = **756.96**
- p-value = **0.0000**

Since the p-value is below 0.05, the null hypothesis was rejected.

### Conclusion

Carrier selection has a statistically significant effect on shipment cost.

---

## 4. Chi-Square Test

**Purpose:** Examine whether delivery mode and shipment status are statistically associated.

### Result

- Chi-square statistic = **0.5068**
- p-value = **0.4765**

Since the p-value is above 0.05, the null hypothesis was not rejected.

### Conclusion

Delivery mode and shipment status are statistically independent in this dataset.

---

# 💰 Power BI – Financial Efficiency

Power BI was used to create interactive dashboards for financial and operational analysis.

## Dashboard Pages

### Executive Financial Overview

Provides a high-level view of:

- Total shipment cost
- Average shipment cost
- Total operational cost
- Average operational cost
- Warehouse utilization
- Inventory turnover
- Shipment cost trends
- Carrier analysis
- Delivery mode analysis

### Warehouse Performance

Analyzes:

- Operational cost
- Warehouse utilization
- Labour effort
- Inventory turnover
- Carrying cost
- Warehouse-level performance

### Cost Optimization

Focuses on:

- High-cost shipments
- Shipment cost vs weight
- Operational cost
- Cost drivers
- High-cost warehouses
- Cost reduction opportunities

### 📊 Power BI Dashboard Screenshots

- [Executive Financial Overview](./powerbi/dashboard_screenshots/executive_financial_overview.png)
- [Warehouse Performance](./powerbi/dashboard_screenshots/warehouse_performance.png)
- [Cost Optimization](./powerbi/dashboard_screenshots/cost_optimization.png)

---

# 🤖 Machine Learning – Shipment Cost Prediction

Machine learning was used to predict **Shipment Cost**.

## Models Evaluated

1. Simple Linear Regression
2. Multiple Linear Regression
3. Random Forest Regressor

The models were evaluated using:

- Mean Absolute Error (MAE)
- Root Mean Squared Error (RMSE)
- R² Score

---

## 🏆 Best Evaluated Model – Random Forest

| Metric | Result |
|---|---:|
| MAE | 10.78 |
| RMSE | 20.40 |
| R² | 0.30 |

Random Forest produced the lowest prediction errors among the evaluated models and achieved the best R² score.

### Feature Importance

| Feature | Importance |
|---|---:|
| Weight | 0.94044 |
| Delivery Mode | 0.03175 |
| Carrier Name | 0.01115 |
| Warehouse ID | 0.000065 |
| Destination Region | 0.00000 |

> Feature importance indicates the relative contribution of each feature to the model's predictions. It does not mean that the feature directly causes the shipment cost.

---

# 🔍 Consolidated Business Insights

The overall analysis produced several important findings:

- Delivery mode has a significant effect on average shipment cost.
- Carrier selection significantly affects shipment cost.
- Warehouse utilization alone does not sufficiently explain operational cost.
- **21 products** require replenishment attention.
- **PLANT16** has the highest total inventory level and significant operational effort.
- **PLANT17** has the highest number of products requiring reorder.
- **PLANT18** has the highest carrying cost.
- Inventory lead time is consistently **5 days**.
- High-cost shipments should be investigated for potential optimization.
- Shipment weight is the strongest predictor among the evaluated machine-learning features.

> **Note:** Total cost contribution and average cost per shipment are different measures. Although Air represents the majority of shipment volume and cost contribution in the dataset, Ground has a higher average shipment cost. These findings therefore describe different aspects of transportation cost.

---

# 💡 Business Recommendations

### 🚚 Transportation Optimization

Review delivery mode selection based on shipment requirements, cost, and delivery timelines.

### 🤝 Carrier Performance Management

Analyze carrier-level cost and performance and use the findings for contract and vendor discussions.

### 🏭 Warehouse Optimization

Evaluate warehouses using multiple KPIs such as utilization, operational cost, labour effort, fulfilment, and inventory turnover rather than relying on utilization alone.

### 📦 Inventory Optimization

Prioritize products requiring replenishment and monitor stock levels against reorder requirements.

### 💰 Carrying Cost Reduction

Investigate warehouses with higher carrying costs and identify opportunities to reduce unnecessary inventory holding.

### 📊 High-Cost Shipment Monitoring

Monitor unusually expensive shipments and investigate the underlying cost drivers.

### 🤖 Predictive Analytics

Use shipment cost prediction to support future transportation planning and budgeting decisions.

---

# 🚀 Future Scope

The project can be further enhanced by incorporating:

- Route distance
- Fuel prices
- Traffic conditions
- Weather conditions
- Demand forecasting
- Route optimization
- Real-time logistics monitoring
- Automated inventory replenishment
- Real-time Power BI reporting
- Advanced machine-learning models
- Integrated logistics analytics platform

---

# 📁 Repository Structure

```text
logitech-logistics-analytics/
│
├── data/
│   └── README.md
│
├── excel/
│   ├── README.md
│   └── LogiTech_Excel_Dashboard.xlsx
│
├── sql/
│   ├── README.md
│   └── warehouse_analysis.sql
│
├── python/
│   ├── README.md
│   ├── inventory_eda.ipynb
│   ├── statistical_analysis.ipynb
│   └── shipment_cost_prediction.ipynb
│
├── powerbi/
│   ├── README.md
│   └── dashboard_screenshots/
│       ├── README.md
│       ├── executive_financial_overview.png
│       ├── warehouse_performance.png
│       └── cost_optimization.png
│
├── documentation/
│   ├── README.md
│   ├── LogiTech_Capstone_Final_Report.pdf
│   └── LogiTech_Capstone_Presentation.pdf
│
├── .gitignore
└── README.md

# 📚 Documentation

The complete project documentation and presentation are available below.

### 📄 Final Project Report

A detailed report covering the complete project methodology, data preparation, analysis, statistical validation, machine learning, business insights, recommendations, limitations, and future scope.

➡️ **[Read the Final Project Report](./documentation/LogiTech_Capstone_Final_Report.pdf)**

---

### 🎞️ Project Presentation

The final presentation summarizing the project objectives, methodology, analysis, findings, and business recommendations.

➡️ **[View the Project Presentation](./documentation/LogiTech_Capstone_Presentation.pdf)**

---

### 📊 Power BI Dashboards

Interactive Power BI dashboards were developed to analyze financial efficiency, warehouse performance, and cost optimization.

➡️ **[View Power BI Dashboard Screenshots](./powerbi/dashboard_screenshots/)**

---

# 👨‍💻 Author

## Pranav Prakash Bhosale

🎓 **BE Computer Engineering**  
📊 **Data Analytics**

---

## 🛠️ Technical Skills

### 📊 Data Analytics
- Microsoft Excel
- SQL
- Python
- Power BI

### 🐍 Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn

### 🗄️ Database
- MySQL

### 📈 Analytics
- Exploratory Data Analysis (EDA)
- Data Cleaning
- Data Visualization
- Statistical Analysis
- Machine Learning

---

## 📌 Project Highlights

- Analyzed **211,457 operational records** across three datasets.
- Built an interactive **Excel dashboard** for delivery reliability and cost efficiency.
- Performed **warehouse analysis using MySQL/SQL**.
- Conducted **Python-based inventory EDA**.
- Developed **Power BI dashboards** for financial and operational analysis.
- Applied **t-Test, Pearson Correlation, ANOVA, and Chi-Square** statistical techniques.
- Developed shipment cost prediction models using **Linear Regression and Random Forest**.
- Identified key business insights and provided actionable recommendations for logistics and warehouse optimization.

---

## 🔗 Repository Contents

| Area | Description |
|---|---|
| 📗 [Excel](./excel/) | Delivery reliability and cost efficiency analysis |
| 🗄️ [SQL](./sql/) | Warehouse capacity and operational analysis |
| 🐍 [Python](./python/) | Inventory EDA, statistical analysis and machine learning |
| 📊 [Power BI](./powerbi/) | Financial and operational dashboards |
| 📚 [Documentation](./documentation/) | Final project report and presentation |
| 📁 [Data](./data/) | Dataset information |

---

## ⭐ Project

This project demonstrates an end-to-end data analytics workflow, from raw operational data to **business insights, statistical validation, interactive dashboards, and predictive analytics**.

The goal is not only to analyze data, but to transform analytical findings into **practical business recommendations for improving logistics and warehousing efficiency**.
