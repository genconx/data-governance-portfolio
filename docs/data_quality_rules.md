# Data Quality Rules

| Rule ID | Field(s) | Rule Description | Check Type | Severity | Expected |
|---|---|---|---|---|---|
| DQ-001 | member_id | Must not be null | Completeness | High | 0% null |
| DQ-002 | member_id + month | Should be unique per member per month (no duplicate rows) | Uniqueness | High | 100% unique |
| DQ-003 | member_status | Must be in {Active, Paused, Cancelled} | Validity | High | Allowed values only |
| DQ-004 | program_level | Must be in {Beginner, Intermediate, Advanced} | Validity | Medium | Allowed values only |
| DQ-005 | plan_type | Must be in {Limited, Unlimited} | Validity | High | Allowed values only |
| DQ-006 | monthly_fee + plan_type | Limited must be 199, Unlimited must be 210 | Consistency | High | 100% match |
| DQ-007 | enrollment_date | Must be a valid date and not in the future relative to month | Timeliness | High | Valid + logical |
| DQ-008 | cancellation_date + member_status | If status=Active, cancellation_date should be null | Consistency | Medium | 100% compliant |
| DQ-009 | cancellation_date + enrollment_date | cancellation_date cannot be before enrollment_date | Consistency | High | 100% compliant |
| DQ-010 | attendance_limit + plan_type | Limited must have 12; Unlimited must be null | Consistency | Medium | 100% compliant |
| DQ-011 | classes_attended + plan_type | If Limited, classes_attended must be <= 12 | Validity | High | 0 violations |
| DQ-012 | billing_status + last_payment_date | If billing_status=Paid, last_payment_date should not be null | Completeness | Medium | 0% null |