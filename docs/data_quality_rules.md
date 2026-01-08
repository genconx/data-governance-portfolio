# Data Quality Rules

## Purpose
Define quality checks to ensure data is complete, valid, consistent, and usable for reporting.

## Rule Categories
- Completeness: required fields are not blank
- Validity: values follow allowed formats/ranges
- Uniqueness: no duplicate IDs where uniqueness is expected
- Consistency: related fields agree with each other (e.g., status vs. end date)
- Timeliness: dates make sense and are not in the future (unless expected)

## Rule Log (Template)
| Rule ID | Field(s) | Rule Description | Check Type | Severity | Expected | Result | Notes |
|---|---|---|---|---|---|---|---|
| DQ-001 |  |  | Completeness | High |  |  |  |