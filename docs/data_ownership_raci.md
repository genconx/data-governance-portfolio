# Data Ownership & RACI Matrix

## Purpose
This document defines data ownership, stewardship responsibilities, and decision rights for critical membership, attendance, and billing data. Clear ownership ensures accountability, consistent standards enforcement, and timely issue resolution.

---

## RACI Definitions
- **R (Responsible):** Executes the task or maintains the data
- **A (Accountable):** Ultimately owns the outcome and approves changes
- **C (Consulted):** Provides input or subject-matter expertise
- **I (Informed):** Kept aware of decisions and changes

---

## Field-Level Data Ownership

| Data Field | Accountable (A) | Responsible (R) | Consulted (C) | Informed (I) |
|---|---|---|---|---|
| member_id | Operations | Enrollment Admin | IT | Finance |
| member_status | Operations | Front Desk / Admin | Training Ops | Finance |
| program_level | Training Director | Instructors | Operations | Finance |
| plan_type | Finance | Billing Admin | Operations | Training Ops |
| monthly_fee | Finance | Billing System | Operations | Leadership |
| classes_attended | Training Ops | Attendance Tracking | Instructors | Finance |
| attendance_limit | Finance | Billing Policy | Operations | Training Ops |
| billing_status | Finance | Billing System | Operations | Leadership |

---

## Governance Decision Rights

| Decision Type | Accountable Owner | Notes |
|---|---|---|
| Add or change program levels | Training Director | Requires update to standards and validation rules |
| Modify pricing or attendance limits | Finance | Triggers downstream rule updates |
| Change member status definitions | Operations | Must align with reporting logic |
| Approve data quality rule changes | Data Steward | Requires documentation update |

---

## Escalation Path
- Data quality issues unresolved within operational teams are escalated to the Data Steward.
- Cross-functional conflicts are resolved by the Accountable owner for the affected domain.