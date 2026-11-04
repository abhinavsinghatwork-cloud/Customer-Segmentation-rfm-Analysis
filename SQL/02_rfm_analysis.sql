-- ============================================================
-- 02_rfm_analysis.sql
-- Purpose: Calculate customer-level RFM metrics and quintile scores
-- Requires: MySQL 8.0+ (for NTILE window function)
-- ============================================================

USE customer_segmentation;

-- Step 1: Calculate Recency, Frequency, and Monetary values.
-- Recency reference date = one day after the latest completed order.
CREATE TABLE customer_rfm AS
SELECT
    c.id AS customer_id,

    DATEDIFF(
        (SELECT DATE_ADD(MAX(ordered_at), INTERVAL 1 DAY)
         FROM orders
         WHERE status = 'completed'),
        MAX(o.ordered_at)
    ) AS recency,

    COUNT(DISTINCT o.id) AS frequency,

    SUM(o.order_total) AS monetary

FROM customers c
JOIN orders o
    ON c.id = o.customer_id

WHERE o.status = 'completed'

GROUP BY c.id;

-- Step 2: Assign 1-to-5 quintile scores for each RFM metric.
-- Lower recency is better; higher frequency and monetary are better.
CREATE TABLE customer_rfm_scores AS
SELECT
    customer_id,
    recency,
    frequency,
    monetary,

    NTILE(5) OVER (
        ORDER BY recency DESC
    ) AS R_score,

    NTILE(5) OVER (
        ORDER BY frequency ASC
    ) AS F_score,

    NTILE(5) OVER (
        ORDER BY monetary ASC
    ) AS M_score

FROM customer_rfm;
