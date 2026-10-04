# Sales Performance Analysis using PostgreSQL

## Project Overview

This project analyses **B2B sales pipeline data** from a fictitious company that sells computer hardware.

The analysis was carried out using **PostgreSQL** to explore sales performance and answer four business questions:

1. **How is each sales team performing compared to the rest?**
2. **Are any sales agents lagging behind?**
3. **Are there any quarter-over-quarter trends?**
4. **Do any products have better win rates?**

The goal of the project was not only to calculate sales metrics, but also to turn the SQL results into **business insights and actionable recommendations for stakeholders**.

---

## Business Questions

### 1. How is each sales team performing compared to the rest?

Teams were defined based on the **manager** responsible for a group of sales agents.

The analysis compared teams using multiple performance measures:

- Total sales
- Total opportunities
- Won deals
- Win rate
- Average won deal value

This helped provide a more complete view of team performance rather than relying on total sales alone.

### 2. Are any sales agents lagging behind?

The analysis moved from team-level performance to individual sales agents.

Each agent was compared using:

- Total sales
- Total opportunities
- Won deals
- Win rate
- Average won deal value

This made it possible to identify agents whose performance may require additional support while also considering the difference between sales volume, conversion efficiency, and deal value.

### 3. Are there any quarter-over-quarter trends?

The sales pipeline was analysed by quarter using the `close_date`.

The following metrics were compared across quarters:

- Total won sales
- Total opportunities
- Won deals
- Win rate
- Average won deal value

An important data consideration was that **Q1 only contains data from March 2017**, so it is not directly comparable with the full Q2, Q3 and Q4 periods.

### 4. Do any products have better win rates?

Products were compared using:

- Total opportunities
- Won opportunities
- Win rate
- Total won sales
- Average won deal value

This showed that a product with a higher win rate does not necessarily generate the highest total sales.

---

## Dataset

The dataset contains B2B sales pipeline information for a fictitious computer hardware company.

The database contains four tables:

| Table | Description |
|---|---|
| `sales_teams` | Sales agents, their managers and regional offices |
| `sales_pipeline` | Sales opportunities, including sales agent, product, account, deal stage, close value and close date |
| `products` | Product information |
| `accounts` | Customer account information |

The tables were created and imported into **PostgreSQL** before the analysis began.

---

## Tools Used

- **PostgreSQL**
- **SQL**
- **Microsoft Word** — detailed project documentation
- **GitHub** — project presentation and version control

### SQL concepts used

Throughout the project, I worked with:

- `SELECT`
- `INNER JOIN`
- `GROUP BY`
- `SUM()`
- `COUNT()`
- `AVG()`
- `FILTER`
- `WHERE`
- `ORDER BY`
- `CAST()`
- `ROUND()`
- Subqueries
- Date functions
- Conditional aggregation

---

## Analysis Approach

The analysis was built step by step rather than creating one large query immediately.

### Team Performance

```text
sales_teams
     ↓
JOIN
     ↓
sales_pipeline
     ↓
GROUP BY manager
     ↓
Calculate sales metrics
     ↓
Compare teams
```

The `sales_teams` and `sales_pipeline` tables were joined using `sales_agent`.

The manager was then used to represent each sales team.

### Agent Performance

```text
sales_teams
     ↓
JOIN
     ↓
sales_pipeline
     ↓
GROUP BY sales_agent
     ↓
Calculate performance metrics
     ↓
Compare individual agents
```

### Quarterly Trends

```text
sales_pipeline
     ↓
close_date
     ↓
Extract quarter
     ↓
GROUP BY quarter
     ↓
Calculate quarterly metrics
     ↓
Compare Q1 → Q2 → Q3 → Q4
```

### Product Performance

```text
sales_pipeline
     ↓
GROUP BY product
     ↓
Calculate product metrics
     ↓
Compare win rates, sales and deal values
```

---

# Key Findings

## 1. Sales Team Performance

The teams produced different results across the performance measures.

### Total Won Sales

| Team | Total Won Sales |
|---|---:|
| Melvin Marxen | $2,251,930 |
| Summer Sewald | $1,964,750 |
| Rocco Neubert | $1,960,545 |
| Celia Rouche | $1,603,897 |
| Cara Losch | $1,130,049 |
| Dustin Brinkmann | $1,094,363 |

Melvin Marxen's team generated the highest total sales.

However, total sales alone did not provide the complete picture.

For example, Rocco Neubert's team had the **highest win rate (52.07%)** and the **highest average won deal value ($2,837.26)**.

Melvin Marxen's team handled the highest number of opportunities, but its win rate was **45.72%**.

This demonstrates why multiple performance metrics are needed when comparing sales teams.

---

## 2. Sales Agent Performance

The agent-level analysis showed that different agents had different strengths.

For example:

- **Lajuana Vencill** had the lowest win rate at **40.84%**, with 311 opportunities and 127 won deals.
- **Markita Hansen** had a **42.48%** win rate across 306 opportunities.
- **Gladys Colclough** had a **42.59%** win rate across 317 opportunities.
- **Reed Clapper** had the highest win rate at **65.40%**, with 237 opportunities and 155 won deals.
- **Garret Kinder** had a **60.98%** win rate despite handling only 123 opportunities.

These results show why agents should not be assessed using total sales alone.

For example, a lower total sales figure can result from handling fewer opportunities rather than having poor conversion performance.

---

## 3. Quarter-over-Quarter Trends

The quarterly analysis produced the following results:

| Quarter | Total Won Sales | Total Deals | Won Deals | Win Rate | Avg. Won Deal |
|---|---:|---:|---:|---:|---:|
| Q1 | $1,134,672 | 647 | 531 | 82.07% | $2,136.86 |
| Q2 | $3,086,111 | 2,032 | 1,254 | 61.71% | $2,461.01 |
| Q3 | $2,982,255 | 2,047 | 1,257 | 61.41% | $2,372.52 |
| Q4 | $2,802,496 | 1,985 | 1,196 | 60.25% | $2,343.22 |

Q1 is only partially represented because the dataset begins in **March 2017**, so its results should not be directly compared with the full quarters.

From Q2 to Q4, total won sales decreased from **$3.09M to $2.80M**.

During the same period:

- Win rate decreased from **61.71% to 60.25%**
- Average won deal value decreased from **$2,461.01 to $2,343.22**
- Won deals remained relatively stable from Q2 to Q3 before decreasing in Q4

Overall, the data shows a downward trend in sales after Q2, accompanied by slightly lower conversion and smaller average won deal values.

---

## 4. Product Performance

Product performance also varied across different measures.

### Win Rate

| Product | Win Rate |
|---|---:|
| GTX Plus Pro | 49.48% |
| GTXPro | 49.26% |
| GTX Basic | 49.04% |
| MG Special | 48.03% |
| GTX Plus Basic | 47.22% |
| MG Advanced | 46.32% |
| GTK 500 | 37.50% |

**GTX Plus Pro** had the highest win rate at **49.48%**.

However, **GTXPro** generated the highest total won sales at approximately **$3.51M**.

This is an important finding because the product with the highest win rate was not the product with the highest total sales.

GTK 500 had the lowest win rate, but it had only **40 total opportunities**, so its result should be interpreted cautiously.

---

# Stakeholder Recommendations

The analysis suggests several areas where stakeholders can focus their attention.

### Sales Teams

- Focus on improving conversion for teams with lower win rates while maintaining existing sales volume.
- Support teams with lower average won deal values in developing higher-value opportunities.
- Share successful sales practices from teams with strong win rates and deal values.
- Evaluate team performance using several metrics rather than total sales alone.

### Sales Agents

- Provide targeted coaching to agents with consistently lower win rates.
- Focus on improving conversion while maintaining strong average deal values where applicable.
- Avoid automatically classifying agents with lower total sales as weak performers, because opportunity volume also affects total sales.
- Use multiple metrics to identify the type of support each agent needs.

### Quarterly Performance

- Use Q2 as a useful reference point because it recorded the highest total won sales among the full quarters.
- Monitor win rate and average won deal value alongside total revenue.
- Set quarterly targets for won deals, win rate and average deal value rather than relying only on total revenue.
- Pay particular attention to the decline in average won deal value from Q2 through Q4.

### Products

- Continue monitoring GTX Plus Pro because of its strong win rate.
- Maintain focus on GTXPro because it generated the highest total won sales.
- Look for opportunities to increase average deal value for high-volume products such as GTX Basic.
- Improve conversion for products with lower win rates while protecting their existing deal values.
- Treat results for low-volume products cautiously before making major decisions.

---

# Key Takeaway

The main lesson from this analysis is that **no single metric provides a complete picture of sales performance**.

A team can generate high revenue because it handles a large number of opportunities, while another team may convert opportunities more efficiently.

Similarly, a product can have a high win rate without generating the highest total sales.

Therefore, this project compares:

**Volume → Conversion → Deal Value → Revenue**

By combining these measures, stakeholders can identify where performance is strong, where support may be required, and which areas should be monitored over time.

---

# Project Structure

The repository is organised to separate the SQL analysis, documentation and supporting materials.

```text
sales-performance-analysis/
│
├── README.md
│
├── data/
│   └── README.md
│
├── sql/
│   ├── 01_team_performance.sql
│   ├── 02_agent_performance.sql
│   ├── 03_quarterly_trends.sql
│   └── 04_product_performance.sql
│
├── documentation/
│   └── Sales_Performance_Analysis.docx
│
└── screenshots/
    ├── team_analysis.png
    ├── agent_analysis.png
    ├── quarterly_analysis.png
    └── product_analysis.png
```

---

# Documentation

The detailed project documentation contains the step-by-step analysis, SQL queries, results, insights, recommendations and conclusion.

The SQL files in this repository contain the queries used to answer each business question.

The Word document provides the more detailed explanation of the analytical process and learning journey.

---

# What I Learned

This project helped me develop practical SQL skills by building the analysis step by step.

Some of the main concepts I learned were:

- How relational tables can be connected using `JOIN`
- How `INNER JOIN` works in PostgreSQL
- How to identify which table a column belongs to
- How to group data using `GROUP BY`
- How aggregate functions such as `SUM()`, `COUNT()` and `AVG()` work
- How conditional aggregation can be used to calculate metrics such as win rate
- Why integer division can affect percentage calculations
- How subqueries can be used to build more complex calculations
- How to analyse dates by quarter
- How to compare business performance using multiple metrics
- How to turn SQL results into business insights and recommendations

Most importantly, I learned that SQL analysis is not simply about writing a query that produces numbers.

The process is:

```text
Business Question
       ↓
Understand the Data
       ↓
Identify Relevant Tables
       ↓
Build the SQL Query
       ↓
Check the Results
       ↓
Interpret the Numbers
       ↓
Generate Business Insights
       ↓
Make Actionable Recommendations
```

---

## Conclusion

This project demonstrates how PostgreSQL can be used to analyse sales pipeline data and translate SQL results into business-focused insights.

By analysing team performance, individual sales agents, quarterly trends and product win rates, the project provides several different perspectives on sales performance.

The analysis also demonstrates the importance of looking beyond a single metric and considering **sales volume, conversion efficiency and deal value together** when evaluating performance.