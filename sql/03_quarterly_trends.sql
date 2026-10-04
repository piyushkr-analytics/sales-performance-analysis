SELECT EXTRACT(QUARTER FROM close_date) AS quarter, 
SUM(close_value) FILTER(WHERE deal_stage = 'Won') AS total_sales,
COUNT(opportunity_id) AS total_deals,
COUNT(opportunity_id) FILTER (WHERE deal_stage = 'Won') AS won_deals,
ROUND(COUNT(opportunity_id) FILTER (WHERE deal_stage = 'Won') / CAST(COUNT(opportunity_id) AS decimal) * 100, 2) AS win_rate,
ROUND(AVG(close_value) FILTER(WHERE deal_stage = 'Won'), 2) AS avg_deal

FROM sales_pipeline
GROUP BY quarter
ORDER BY quarter;

--Null values are the deals who dont have a close value(not won)