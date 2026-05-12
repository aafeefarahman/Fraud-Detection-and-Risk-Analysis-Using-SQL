<img width="1956" height="319" alt="image" src="https://github.com/user-attachments/assets/9367ad71-3ea5-43da-9c47-4b86bc9c2e7b" />

```md id="5l2wrf"
## Objectives
- To investigate and analyze fraudulent transaction behavior using SQL on a real-world inspired transaction dataset
- To uncover hidden fraud patterns through behavioral, transactional, and time-based analysis
- To simulate real-world fraud investigation workflows commonly used in fintech, banking, and e-commerce platforms
- To build a rule-based fraud detection system using SQL queries and analytical logic
- To strengthen practical SQL skills by solving real fraud analytics scenarios on large-scale transactional data

---

## SQL Operations & Analytical Techniques Implemented

### Database Design & Data Preparation
- Created and managed a dedicated fraud detection database environment
- Structured transaction data using relational database concepts
- Imported and handled large-scale transaction records for analysis
- Cleaned raw timestamp data and transformed it into DATETIME format for accurate time-based analytics
- Performed data preprocessing to improve query efficiency and analytical accuracy

### Querying, Filtering & Data Exploration
- Used SELECT statements to retrieve and explore fraud-related transaction records
- Applied WHERE clauses to filter suspicious activities and high-risk transactions
- Used ORDER BY and LIMIT to identify top fraudulent transactions and unusual spending behavior
- Performed targeted analysis on transaction values, user activity, devices, and traffic sources

### Aggregation & Behavioral Analysis
- Used GROUP BY to analyze fraud distribution across:
  - Browsers
  - Devices
  - Traffic acquisition sources
  - User age groups
  - IP addresses
- Applied HAVING clauses to identify repeated suspicious activities and shared device usage
- Used aggregate functions:
  - COUNT() for fraud frequency analysis
  - AVG() for spending behavior analysis
  - MAX() for identifying unusually high-value transactions
  - SUM() for calculating fraud percentages and statistical insights

### Time-Based Fraud Detection
- Converted textual timestamps into DATETIME values using STR_TO_DATE()
- Used TIMESTAMPDIFF() to calculate the time gap between account signup and purchase activity
- Performed velocity fraud analysis to detect accounts making purchases immediately after registration
- Investigated suspicious late-night transaction behavior commonly associated with fraudulent activity

### Fraud Detection & Risk Engineering
- Built a rule-based fraud risk scoring system using SQL logic
- Implemented CASE statements to categorize transactions into LOW, MEDIUM, and HIGH risk groups
- Detected shared device usage across multiple accounts to identify potential fraud rings
- Tracked suspicious IP addresses associated with repeated fraudulent activity
- Identified anomalous transaction behavior and repeat fraud patterns

---

## Fraud Analytics Performed
- Fraud vs Non-Fraud Transaction Analysis
- Browser-Based Fraud Pattern Detection
- Device Sharing & Multi-Account Fraud Analysis
- Traffic Source Investigation
- IP Address Fraud Tracking
- High-Value Transaction Monitoring
- Velocity Fraud Detection
- Repeat Fraud User Analysis
- Late-Night Suspicious Transaction Detection
- Rule-Based Fraud Risk Scoring System

---

## Skills Demonstrated
- SQL Query Optimization
- Data Cleaning & Transformation
- Fraud Analytics
- Behavioral Pattern Detection
- Time-Series Transaction Analysis
- Risk Modeling Concepts
- Relational Database Management
- Analytical Problem Solving
```
