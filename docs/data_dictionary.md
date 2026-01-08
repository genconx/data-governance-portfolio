# Data Dictionary

## Purpose
Define the meaning, format, and allowed values for each field to ensure consistent usage across the business.

## Dictionary

| Field Name | Business Definition | Data Type | Allowed Values / Format | Example | Owner | Notes |
|---|---|---|---|---|---|---|
| member_id | Unique identifier for each student/member | Integer | 1000+ | 1042 | Data Steward | Should be unique per member (DQ check will test) |
| member_status | Current membership status | Text | Active, Paused, Cancelled | Active | Operations | Expect inconsistencies in raw data |
| program_level | Student course level | Text | Beginner, Intermediate, Advanced | Beginner | Training Director | Raw data includes known misspelling for realism |
| plan_type | Attendance plan type | Text | Limited, Unlimited | Limited | Operations | Limited = 3 classes/week |
| monthly_fee | Monthly membership fee charged | Integer | 199 or 210 | 199 | Finance | Limited=199, Unlimited=210 (raw includes mismatches) |
| enrollment_date | Date the student started membership | Date | YYYY-MM-DD | 2025-05-14 | Operations | Must be <= month end |
| cancellation_date | Date membership ended (if cancelled) | Date/Null | YYYY-MM-DD or blank | 2025-10-01 | Operations | Raw includes conflicts for DQ testing |
| month | Reporting month for attendance/billing | Text | YYYY-MM | 2025-11 | Data Steward | One row per member per month |
| classes_attended | Number of classes attended in the month | Integer | 0–20 (typical) | 10 | Training Director | Limited plan should not exceed 12/month |
| attendance_limit | Monthly cap for Limited plan | Integer/Null | 12 for Limited, blank for Unlimited | 12 | Data Steward | Raw includes inconsistencies |
| billing_status | Payment outcome for that month | Text | Paid, Late, Failed | Paid | Finance | Drives payment date expectations |
| last_payment_date | Most recent payment date for that month | Date/Null | YYYY-MM-DD or blank | 2025-09-16 | Finance | If Paid, should usually be present |