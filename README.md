# Customer Segmentation Using RFM Analysis

An end-to-end customer segmentation project using **MySQL** and **Power BI**. The project groups customers by purchasing behaviour using Recency, Frequency, and Monetary (RFM) metrics, then presents the segments in an interactive dashboard.

> **Project status:** Dashboard prototype and segment-level analysis completed. Add the original SQL scripts, source dataset, and Power BI `.pbix` file to the folders in this repository before treating this as a fully reproducible project.

## Business Problem

Businesses need to understand which customers provide the most value, which customers are becoming inactive, and where retention or win-back campaigns may have the greatest impact. RFM analysis provides a practical way to classify customers based on:

- **Recency (R):** How long it has been since the customer's most recent purchase. Lower values indicate more recent activity.
- **Frequency (F):** How often the customer purchased. Higher values indicate more frequent purchasing.
- **Monetary (M):** The customer's monetary contribution. Higher values indicate greater value.

## Tools & Technologies

- MySQL — customer-level aggregation and RFM segmentation
- Power BI Desktop — dashboard development and interactive reporting
- DAX — KPI and segment measures
- Power Query — data import and type validation
- CSV — data exchange between SQL and Power BI

## Customer Segments

The current segmentation output contains four groups:

| Segment | Customer count | Share of customers |
|---|---:|---:|
| Champions | 39 | 18.06% |
| Loyal | 23 | 10.65% |
| At Risk | 118 | 54.63% |
| Lost | 36 | 16.67% |
| **Total** | **216** | **100%** |

Percentages may sum to 100.01% due to rounding.

## Dashboard

The Power BI report includes:

1. KPI cards for total customers and segment counts
2. Customer segment distribution
3. Monetary value by customer segment
4. Average recency by customer segment
5. RFM heatmap matrix with average Frequency, Monetary, and Recency by segment
6. Customer segment slicer
7. Business insights and recommended actions

**Power BI file:** `PowerBI/Customer_Segmentation_RFM.pbix` (to be added)

**Dashboard screenshots:** see `Screenshots/` (to be added)

## Findings From the Current Dashboard

### Segment-level RFM averages

| Segment | Average Frequency | Average Monetary | Average Recency (days) |
|---|---:|---:|---:|
| At Risk | 2.69 | 162.70 | 464.68 |
| Champions | 7.23 | 509.25 | 158.49 |
| Lost | 1.00 | 19.26 | 735.08 |
| Loyal | 6.30 | 230.93 | 307.83 |

### Monetary value by segment

| Segment | Monetary value shown in dashboard |
|---|---:|
| Champions | approximately 19.9K |
| At Risk | approximately 19.2K |
| Loyal | approximately 5.3K |
| Lost | approximately 0.7K |

*Values are transcribed from the current Power BI visuals and shown in the dataset's monetary units. Confirm currency and aggregation against the source data before external presentation.*

### Business interpretation

- **At Risk is the largest segment:** 118 of 216 customers (54.63%) are classified as At Risk. This group is the primary candidate for retention activity.
- **Champions have the strongest RFM averages:** they have the highest average frequency (7.23), highest average monetary value per customer (509.25), and lowest average recency (158.49 days).
- **Lost customers show weak engagement:** their average frequency is 1.00, average monetary value is 19.26, and average recency is 735.08 days.
- **Loyal customers are valuable repeat buyers:** average frequency is 6.30 and average monetary value is 230.93.

## Recommendations

1. Prioritise targeted retention campaigns for At Risk customers, testing relevant incentives and messaging.
2. Protect Champions with loyalty benefits, early access, or personalised engagement.
3. Encourage Loyal customers to repeat purchase and explore relevant cross-sell or upsell opportunities.
4. Use selective win-back campaigns for Lost customers; measure reactivation and campaign cost before scaling.

These are recommendations inferred from the segment summaries, not measured campaign outcomes.

## Repository Structure

```text
Customer-Segmentation-rfm-Analysis/
├── README.md
├── SQL/
│   └── README.md
├── PowerBI/
│   └── README.md
├── Dataset/
│   └── README.md
├── Screenshots/
│   └── README.md
└── Business_Insights/
    └── business_recommendations.md
```

## How to Reproduce

1. Run the SQL setup and RFM scripts in the `SQL/` folder against the source database.
2. Export the resulting customer-level segment table to CSV.
3. Import the CSV into Power BI using Power Query and verify data types.
4. Open the `.pbix` report and refresh the data.
5. Validate the KPI counts, segment percentages, monetary totals, and average RFM metrics against SQL output.

The SQL scripts, input dataset, and PBIX are pending addition, so the steps above are the intended reproducibility workflow rather than a claim that every asset is already included.

## Data & Privacy

Only upload data that you are authorised to share. Remove personal identifiers and confidential customer information before publishing a dataset. If the source dataset is licensed or restricted, publish an anonymised sample or data dictionary instead of the raw data.

## Author

**Abhinav Singh**  
[GitHub](https://github.com/abhinavsinghatwork-cloud) · [LinkedIn](https://www.linkedin.com/in/abhinav-singh-556994344/)

---

*Built as a portfolio project to demonstrate SQL-based customer analytics, RFM segmentation, DAX measures, and Power BI dashboarding.*
