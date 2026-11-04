-- ============================================================
-- 01_database_setup.sql
-- Purpose: Create the database and orders table for RFM analysis
-- ============================================================

CREATE DATABASE IF NOT EXISTS customer_segmentation;

USE customer_segmentation;

CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_number VARCHAR(30),
    ordered_at DATETIME,
    items INT,
    order_total DECIMAL(12,2),
    channel VARCHAR(30),
    status VARCHAR(30)
);

-- Prerequisite for 02_rfm_analysis.sql:
-- The RFM query also joins a `customers` table using customers.id.
-- Ensure that customer_segmentation.customers exists and contains
-- an `id` column before running the RFM analysis script.
