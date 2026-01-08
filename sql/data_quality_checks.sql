/* 
Data Quality Checks (SQL)
Dataset: membership_monthly (synthetic martial arts memberships)
Purpose: Replicate key DQ rules executed in Excel Power Query

Assumptions:
- Table name: membership_monthly
- Columns:
  member_id, month, program_level, plan_type, classes_attended
*/

-- =========================
-- DQ-001: member_id must not be null
-- =========================
SELECT
  COUNT(*) AS dq_001_null_member_id_count
FROM membership_monthly
WHERE member_id IS NULL;

-- Optional: show the offending rows (if any)
SELECT *
FROM membership_monthly
WHERE member_id IS NULL;


-- =========================
-- DQ-002: member_id + month should be unique (no duplicate rows)
-- =========================
-- Show duplicate keys
SELECT
  member_id,
  month,
  COUNT(*) AS row_count
FROM membership_monthly
GROUP BY member_id, month
HAVING COUNT(*) > 1
ORDER BY row_count DESC, member_id, month;

-- Count duplicate "extra rows" (violations) = SUM(row_count - 1)
SELECT
  SUM(row_count - 1) AS dq_002_duplicate_row_violations
FROM (
  SELECT
    member_id,
    month,
    COUNT(*) AS row_count
  FROM membership_monthly
  GROUP BY member_id, month
  HAVING COUNT(*) > 1
) d;


-- =========================
-- DQ-004: program_level must be one of allowed values
-- Allowed: Beginner, Intermediate, Advanced
-- =========================
SELECT
  program_level,
  COUNT(*) AS bad_value_count
FROM membership_monthly
WHERE program_level NOT IN ('Beginner', 'Intermediate', 'Advanced')
   OR program_level IS NULL
GROUP BY program_level
ORDER BY bad_value_count DESC;

-- Optional: show all offending rows
SELECT *
FROM membership_monthly
WHERE program_level NOT IN ('Beginner', 'Intermediate', 'Advanced')
   OR program_level IS NULL;


-- =========================
-- DQ-011: Limited plan attendance must be <= 12
-- =========================
SELECT
  COUNT(*) AS dq_011_limited_over_12_count
FROM membership_monthly
WHERE plan_type = 'Limited'
  AND classes_attended > 12;

-- Optional: show offending rows
SELECT *
FROM membership_monthly
WHERE plan_type = 'Limited'
  AND classes_attended > 12
ORDER BY classes_attended DESC;


-- =========================
-- Quick rollup (single view)
-- =========================
SELECT
  (SELECT COUNT(*) FROM membership_monthly) AS total_rows,
  (SELECT COUNT(*) FROM membership_monthly WHERE member_id IS NULL) AS dq_001_null_member_id,
  (SELECT COALESCE(SUM(row_count - 1), 0)
     FROM (
       SELECT member_id, month, COUNT(*) AS row_count
       FROM membership_monthly
       GROUP BY member_id, month
       HAVING COUNT(*) > 1
     ) x
  ) AS dq_002_duplicate_rows,
  (SELECT COUNT(*)
     FROM membership_monthly
     WHERE program_level NOT IN ('Beginner', 'Intermediate', 'Advanced')
        OR program_level IS NULL
  ) AS dq_004_invalid_program_level,
  (SELECT COUNT(*)
     FROM membership_monthly
     WHERE plan_type = 'Limited' AND classes_attended > 12
  ) AS dq_011_limited_attendance_over_12;