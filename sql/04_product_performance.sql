SELECT product, total_deals, won_deals, 
ROUND(
won_deals / CAST(total_deals AS decimal) * 100, 2) AS win_rate

FROM

(SELECT 
product, COUNT(opportunity_id) AS total_deals,
COUNT(*) FILTER(WHERE deal_stage = 'Won') AS won_deals
FROM sales_pipeline
GROUP BY product)
ORDER BY win_rate DESC;
