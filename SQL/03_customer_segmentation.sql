-- ============================================================
-- 03_customer_segmentation.sql
-- Purpose: Classify customers into RFM-based segments
-- ============================================================

USE customer_segmentation;

CREATE TABLE customer_segments AS
SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    R_score,
    F_score,
    M_score,

    CONCAT(R_score, F_score, M_score) AS RFM_score,

    CASE
        WHEN R_score >= 4
         AND F_score >= 4
         AND M_score >= 4
        THEN 'Champions'

        WHEN R_score >= 3
         AND F_score >= 4
        THEN 'Loyal'

        WHEN R_score <= 2
         AND F_score <= 2
         AND M_score <= 2
        THEN 'Lost'

        ELSE 'At-Risk'
    END AS customer_segment

FROM customer_rfm_scores;
