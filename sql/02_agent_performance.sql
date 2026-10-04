SELECT
sales_teams.sales_agent, 
SUM(sales_pipeline.close_value) FILTER(WHERE Sales_pipeline.deal_stage = 'Won') AS total_sales,

COUNT(sales_pipeline.opportunity_id) AS total_deals,
COUNT(*) FILTER (WHERE sales_pipeline.deal_stage = 'Won') AS won_deals,

ROUND(
COUNT(*) FILTER (WHERE sales_pipeline.deal_stage = 'Won') / CAST(COUNT(sales_pipeline.opportunity_id) AS decimal) * 100, 2) 
AS win_rate,

ROUND(
AVG(sales_pipeline.close_value) FILTER(WHERE sales_pipeline.deal_stage = 'Won'), 2) AS avg_deals

FROM sales_teams
JOIN sales_pipeline
ON sales_teams.sales_agent = sales_pipeline.sales_agent

GROUP BY sales_teams.sales_agent
ORDER BY total_sales DESC;
