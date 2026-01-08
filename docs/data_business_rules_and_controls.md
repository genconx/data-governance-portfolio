# Data Business Rules & Enforcement Standards

## Purpose
This document defines enforceable business rules derived from authoritative data standards. These rules are designed to prevent recurring data quality issues and ensure consistent, decision-ready data across operational and reporting use cases.

---

## Rule Classification Framework
Business rules are classified by enforcement strength:

- **Preventive Controls**: Rules enforced at data entry or ingestion
- **Detective Controls**: Rules monitored after data capture
- **Corrective Actions**: Remediation steps when violations occur

---

## Core Business Rules

### BR-001 — Member Identifier Uniqueness
- **Rule:** Each `member_id` must be unique per reporting month.
- **Related Field(s):** member_id, month
- **Control Type:** Preventive
- **Enforcement Point:** Data ingestion / system integration
- **Violation Handling:** Reject duplicate records or flag for review
- **Related DQ Rule:** DQ-002

---

### BR-002 — Program Level Standardization
- **Rule:** `program_level` must conform to approved controlled values.
- **Related Field(s):** program_level
- **Control Type:** Preventive
- **Enforcement Point:** Data entry UI / validation layer
- **Violation Handling:** Block submission or auto-correct to standard
- **Related DQ Rule:** DQ-004

---

### BR-003 — Attendance Plan Enforcement
- **Rule:** Limited plans may not exceed defined attendance thresholds.
- **Related Field(s):** plan_type, classes_attended, attendance_limit
- **Control Type:** Detective
- **Enforcement Point:** Monthly attendance aggregation
- **Violation Handling:** Generate exception report for review
- **Related DQ Rule:** DQ-011

---

## Monitoring & Review
- Business rule compliance should be reviewed monthly.
- Violations should be tracked and trended to identify systemic issues.
- Rules should be re-evaluated when pricing models or programs change.