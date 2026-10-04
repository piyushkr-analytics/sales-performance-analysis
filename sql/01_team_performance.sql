SELECT
    manager,
    total_deals,
    won_deals,
    ROUND(won_deals / CAST(total_deals AS decimal) * 100, 2) AS win_rate
FROM
(
    SELECT
        sales_teams.manager,
        COUNT(sales_pipeline.opportunity_id) AS total_deals,
        COUNT(*) FILTER (WHERE deal_stage = 'Won') AS won_deals
    FROM sales_teams
    JOIN sales_pipeline
        ON sales_teams.sales_agent = sales_pipeline.sales_agent
    GROUP BY sales_teams.manager
) AS team_stats
ORDER BY win_rate DESC;
