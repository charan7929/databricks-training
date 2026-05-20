1. SELECT
    emp_id,
    CONCAT(UPPER(LEFT(emp_name,1)), LOWER(SUBSTRING(emp_name,2))) AS proper_name,
    department,
    ROUND(base_salary + IFNULL(bonus,0)) AS rounded_total_income,
    YEAR(joining_date) AS joining_year,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS experience_years,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) > 7 THEN 'Senior'
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) BETWEEN 4 AND 7 THEN 'Mid'
        ELSE 'Junior'
    END AS employee_level
FROM employee_payments;


2. SELECT
    order_id,
    UPPER(customer_name) AS customer_name,
    order_date,
    IFNULL(delivery_date, CURDATE()) AS final_delivery_date,
    DATEDIFF(IFNULL(delivery_date, CURDATE()), order_date) AS delivery_days,
    TRUNCATE(order_amount, 1) AS truncated_amount,
    CASE
        WHEN delivery_date IS NULL THEN 'Pending'
        WHEN DATEDIFF(delivery_date, order_date) = 0 THEN 'Same-day'
        WHEN DATEDIFF(delivery_date, order_date) > 3 THEN 'Delayed'
        ELSE 'On Time'
    END AS delivery_status
FROM orders_delivery;

3. SELECT
    cust_id,
    CONCAT(UPPER(LEFT(cust_name,1)), LOWER(SUBSTRING(cust_name,2))) AS customer_name,
    MONTHNAME(purchase_date) AS purchase_month,
    ROUND(purchase_amount) AS rounded_amount,
    ABS(purchase_amount) AS absolute_purchase,
    CASE
        WHEN purchase_amount > 15000 THEN 'High Spender'
        WHEN purchase_amount BETWEEN 8000 AND 15000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_category
FROM customer_spending;

4. SELECT
    user_id,
    user_email,
    SUBSTRING_INDEX(user_email, '@', -1) AS email_domain,
    TIMESTAMPDIFF(MONTH, start_date, end_date) AS duration_months,
    FORMAT(subscription_fee, 2) AS formatted_fee,
    DATEDIFF(end_date, CURDATE()) AS remaining_days,
    CASE
        WHEN end_date < CURDATE() THEN 'Expired'
        WHEN DATEDIFF(end_date, CURDATE()) <= 30 THEN 'Expiring Soon'
        ELSE 'Active'
    END AS subscription_status
FROM subscriptions;

5. SELECT
    loan_id,
    UPPER(customer_name) AS customer_name,
    loan_amount,
    interest_rate,
    ROUND(loan_amount * POWER(1 + interest_rate / 100, 1) / 12) AS rounded_monthly_emi,
    TIMESTAMPDIFF(YEAR, loan_start, CURDATE()) AS years_since_loan_start,
    CASE
        WHEN interest_rate > 9 THEN 'High Risk'
        WHEN interest_rate BETWEEN 8 AND 9 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM loan_details;

6. SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    ROUND((present_days / total_days) * 100) AS attendance_percentage,
    MONTHNAME(record_date) AS attendance_month,
    total_days - present_days AS absent_days,
    CASE
        WHEN (present_days / total_days) * 100 >= 90 THEN 'Excellent'
        WHEN (present_days / total_days) * 100 BETWEEN 75 AND 89 THEN 'Average'
        ELSE 'Poor'
    END AS attendance_status
FROM attendance;

7. SELECT
    product_id,
    CONCAT(UPPER(LEFT(product_name,1)), LOWER(SUBSTRING(product_name,2))) AS product_name,
    ABS(mrp - selling_price) AS discount_amount,
    ROUND(((mrp - selling_price) / mrp) * 100, 2) AS discount_percentage,
    DAYNAME(sale_date) AS sale_day,
    CASE
        WHEN selling_price < mrp THEN 'Valid Discount'
        WHEN selling_price > mrp THEN 'Overpriced'
        ELSE 'No Discount'
    END AS discount_status
FROM product_sales;

8. SELECT
    policy_id,
    UPPER(holder_name) AS holder_name,
    TIMESTAMPDIFF(YEAR, policy_start, policy_end) AS policy_duration_years,
    DATEDIFF(policy_end, CURDATE()) AS remaining_days,
    ROUND(premium_amount) AS rounded_premium,
    CASE
        WHEN policy_end < CURDATE() THEN 'Expired'
        WHEN TIMESTAMPDIFF(YEAR, policy_start, policy_end) >= 3 THEN 'Long Term'
        ELSE 'Mid Term'
    END AS policy_status
FROM insurance_policies;

9. SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_last_hike,
    CASE
        WHEN rating = 5 THEN current_salary * 0.20
        WHEN rating = 4 THEN current_salary * 0.10
        ELSE 0
    END AS increment_amount,
    ROUND(current_salary + CASE
        WHEN rating = 5 THEN current_salary * 0.20
        WHEN rating = 4 THEN current_salary * 0.10
        ELSE 0
    END) AS new_salary,
    CASE
        WHEN rating = 5 THEN 'High Increment'
        WHEN rating = 4 THEN 'Moderate'
        ELSE 'No Increment'
    END AS increment_status
FROM salary_revision;

10. SELECT
    account_id,
    customer_name,
    ABS(balance) AS absolute_balance,
    DATEDIFF(CURDATE(), last_transaction) AS days_since_last_transaction,
    CONCAT(UPPER(LEFT(branch,1)), LOWER(SUBSTRING(branch,2))) AS branch_name,
    SIGN(balance) AS balance_sign,
    CASE
        WHEN balance < 0 THEN 'Overdrawn'
        WHEN DATEDIFF(CURDATE(), last_transaction) > 180 THEN 'Dormant'
        ELSE 'Active'
    END AS account_status
FROM bank_accounts;



level 1 :
1. SELECT
    emp_id,
    LOWER(emp_name) AS emp_name,
    ROUND(salary - (salary * tax_percent / 100)) AS net_salary,
    YEAR(last_revision) AS revision_year,
    TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) AS months_since_revision,
    CASE
        WHEN tax_percent > 20 AND TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) > 24 THEN 'Flag Tax Shock'
        WHEN tax_percent BETWEEN 15 AND 20 THEN 'Flag Review Needed'
        ELSE 'Stable'
    END AS status
FROM salary_audit;

2. SELECT
    emp_code,
    CONCAT(UPPER(LEFT(emp_name,1)), LOWER(SUBSTRING(emp_name,2))) AS emp_name,
    ROUND((bonus / base_salary) * 100, 2) AS bonus_percentage,
    DAYNAME(bonus_date) AS bonus_day,
    ABS(base_salary - bonus) AS salary_bonus_difference,
    CASE
        WHEN (bonus / base_salary) * 100 > 30 AND DAYNAME(bonus_date) IN ('Saturday','Sunday') THEN 'Suspicious'
        WHEN (bonus / base_salary) * 100 <= 20 THEN 'Normal'
        ELSE 'Audit'
    END AS bonus_status
FROM bonus_monitor;

3. SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS actual_experience,
    declared_experience - TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS experience_difference,
    FLOOR(salary) AS floor_salary,
    CASE
        WHEN declared_experience > TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) THEN 'Overstated'
        WHEN declared_experience < TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) THEN 'Understated'
        ELSE 'Matched'
    END AS experience_status
FROM employee_experience;

4. SELECT
    emp_id,
    emp_name,
    RIGHT(emp_name, 2) AS last_two_chars,
    DAY(credit_date) AS credit_day,
    TRUNCATE(salary, 0) AS salary_integer,
    MOD(TRUNCATE(salary,0), 10) AS salary_mod,
    CASE
        WHEN MOD(TRUNCATE(salary,0), 10) = DAY(credit_date) THEN 'Pattern Match'
        ELSE 'No Match'
    END AS pattern_status
FROM salary_digits;

5. SELECT
    emp_id,
    LOWER(emp_name) AS emp_name,
    DAYOFWEEK(payment_date) AS weekday_number,
    DAYNAME(payment_date) AS weekday_name,
    ROUND(salary) AS rounded_salary,
    MOD(ROUND(salary), 2) AS salary_mod,
    CASE
        WHEN MOD(ROUND(salary), 2) = 0 AND MOD(DAYOFWEEK(payment_date), 2) = 1 THEN 'Violation'
        ELSE 'Compliant'
    END AS compliance_status
FROM payroll_control;

6. SELECT
    emp_id,
    CONCAT(UPPER(LEFT(emp_name,1)), LOWER(SUBSTRING(emp_name,2))) AS emp_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    POWER(TIMESTAMPDIFF(YEAR, last_hike, CURDATE()), 2) AS power_years,
    ROUND(salary * POWER(1.05, TIMESTAMPDIFF(YEAR, last_hike, CURDATE()))) AS salary_impact,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) > 5 THEN 'High Inflation Risk'
        WHEN TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) BETWEEN 3 AND 5 THEN 'Moderate'
        ELSE 'Low'
    END AS inflation_status
FROM inflation_watch;

7. SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    YEAR(record_date) AS record_year,
    SIGN(salary) AS salary_sign,
    ABS(salary) AS absolute_salary,
    CASE
        WHEN salary < 0 THEN 'Negative Error'
        WHEN salary = 0 THEN 'Zero Salary'
        ELSE 'Valid'
    END AS salary_status
FROM salary_integrity;

8. SELECT
    emp_id,
    emp_name,
    LENGTH(emp_name) AS name_length,
    TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS years_of_service,
    ROUND(salary) AS rounded_salary,
    CASE
        WHEN LENGTH(emp_name) > TIMESTAMPDIFF(YEAR, join_date, CURDATE()) THEN 'Name Bias'
        ELSE 'Neutral'
    END AS correlation_status
FROM name_salary;

9. SELECT
    emp_id,
    emp_name,
    MONTHNAME(paid_date) AS paid_month,
    CEIL(salary) AS ceil_salary,
    LAST_DAY(paid_date) AS last_day_of_month,
    CASE
        WHEN paid_date = LAST_DAY(paid_date) THEN 'End Month Spike'
        ELSE 'Regular'
    END AS spike_status
FROM salary_monthly;

10. SELECT
    emp_id,
    emp_name,
    LEFT(emp_name,1) AS first_character,
    TRUNCATE(salary,0) AS salary_integer,
    DAY(audit_date) AS audit_day,
    (
        CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),1,1) AS UNSIGNED) +
        CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),2,1) AS UNSIGNED) +
        CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),3,1) AS UNSIGNED) +
        CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),4,1) AS UNSIGNED) +
        CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),5,1) AS UNSIGNED)
    ) AS digit_sum,
    CASE
        WHEN DAY(audit_date) = (
            CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),1,1) AS UNSIGNED) +
            CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),2,1) AS UNSIGNED) +
            CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),3,1) AS UNSIGNED) +
            CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),4,1) AS UNSIGNED) +
            CAST(SUBSTRING(CAST(TRUNCATE(salary,0) AS CHAR),5,1) AS UNSIGNED)
        ) THEN 'Digit Alert'
        ELSE 'Normal'
    END AS audit_status
FROM digit_audit;

11. SELECT
    emp_id,
    emp_name,
    LEFT(bank_code, 4) AS bank_prefix,
    DAYNAME(credit_date) AS credit_day,
    ROUND(salary) AS rounded_salary,
    MOD(ROUND(salary), 5) AS salary_mod_5,
    CASE
        WHEN DAYNAME(credit_date) IN ('Saturday','Sunday') AND MOD(ROUND(salary),5) = 0 THEN 'Weekend Fraud'
        WHEN LEFT(bank_code,4) = 'HDFC' THEN 'Bank Review'
        ELSE 'Normal'
    END AS fraud_status
FROM salary_credit_audit;

12. SELECT
    emp_id,
    LOWER(emp_name) AS emp_name,
    HOUR(credit_ts) AS credit_hour,
    FLOOR(salary) AS floor_salary,
    FLOOR(salary) - HOUR(credit_ts) AS salary_hour_difference,
    CASE
        WHEN HOUR(credit_ts) BETWEEN 0 AND 3 THEN 'Midnight Drift'
        WHEN HOUR(credit_ts) < 9 OR HOUR(credit_ts) > 18 THEN 'After Hours'
        ELSE 'Business Hours'
    END AS drift_status
FROM salary_time_drift;

13. SELECT
    emp_id,
    emp_name,
    TRUNCATE(salary,2) AS truncated_salary,
    ROUND(salary,2) - TRUNCATE(salary,2) AS difference_value,
    DAYNAME(record_date) AS record_day,
    LENGTH(emp_name) AS name_length,
    CASE
        WHEN ROUND(salary,2) - TRUNCATE(salary,2) > 0.01 THEN 'Precision Loss'
        ELSE 'Safe'
    END AS precision_status
FROM salary_precision;

14. SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    ROUND(base_salary * POWER(growth_rate, TIMESTAMPDIFF(YEAR, last_hike, CURDATE()))) AS projected_salary,
    CASE
        WHEN base_salary * POWER(growth_rate, TIMESTAMPDIFF(YEAR, last_hike, CURDATE())) > 150000 THEN 'Explosive Growth'
        WHEN base_salary * POWER(growth_rate, TIMESTAMPDIFF(YEAR, last_hike, CURDATE())) >= base_salary THEN 'Controlled'
        ELSE 'Stagnant'
    END AS growth_status
FROM salary_growth;

15. SELECT
    emp_id,
    CONCAT(UPPER(LEFT(emp_name,1)), LOWER(SUBSTRING(emp_name,2))) AS emp_name,
    TRUNCATE(salary,0) AS salary_integer,
    REVERSE(CAST(TRUNCATE(salary,0) AS CHAR)) AS reversed_salary,
    DAYNAME(processed_date) AS processed_day,
    CASE
        WHEN CAST(TRUNCATE(salary,0) AS CHAR) = REVERSE(CAST(TRUNCATE(salary,0) AS CHAR)) THEN 'Symmetric Pay'
        ELSE 'Asymmetric'
    END AS symmetry_status
FROM salary_symmetry;

16. SELECT
    emp_id,
    emp_name,
    YEAR(credit_date) AS credit_year,
    CEIL(salary) AS ceil_salary,
    DAYOFYEAR(credit_date) AS day_of_year,
    CASE
        WHEN DAY(credit_date) = 29 AND MONTH(credit_date) = 2 THEN 'Leap Credit'
        ELSE 'Non-Leap Credit'
    END AS leap_status
FROM leap_salary;

17. SELECT
    emp_id,
    LOWER(emp_name) AS emp_name,
    CASE
        WHEN MONTH(credit_date) >= 4 THEN CONCAT(YEAR(credit_date), '-', YEAR(credit_date) + 1)
        ELSE CONCAT(YEAR(credit_date) - 1, '-', YEAR(credit_date))
    END AS fiscal_year,
    MONTH(credit_date) AS credit_month,
    FORMAT(salary,2) AS formatted_salary,
    CASE
        WHEN MONTH(credit_date) = 3 AND DAY(credit_date) = 31 THEN 'Year End Credit'
        WHEN MONTH(credit_date) = 4 AND DAY(credit_date) = 1 THEN 'Year Start Credit'
        ELSE 'Mid Year'
    END AS fiscal_status
FROM fiscal_salary;

18. SELECT
    emp_id,
    emp_name,
    RAND() AS random_value,
    ROUND(salary) AS rounded_salary,
    DAYNAME(record_date) AS record_day,
    LEFT(emp_name,1) AS first_character,
    CASE
        WHEN RAND() > 0.7 THEN 'Sampled'
        ELSE 'Skipped'
    END AS sampling_status
FROM salary_sampling;

19. SELECT
    emp_id,
    emp_name,
    ASCII(LEFT(emp_name,1)) AS first_char_ascii,
    TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS years_since_joining,
    FLOOR(salary) AS floor_salary,
    CASE
        WHEN ASCII(LEFT(emp_name,1)) > TIMESTAMPDIFF(YEAR, join_date, CURDATE()) THEN 'Name Dominates'
        ELSE 'Experience Dominates'
    END AS integrity_status
FROM salary_ascii;

20. SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    DAY(credit_date) AS credit_day,
    MONTH(credit_date) AS credit_month,
    MOD(TRUNCATE(salary,0), 100) AS last_two_salary_digits,
    ABS(DAY(credit_date) - MONTH(credit_date)) AS day_month_difference,
    CASE
        WHEN DAY(credit_date) = MONTH(credit_date)
             OR MOD(TRUNCATE(salary,0), 100) = DAY(credit_date) THEN 'Calendar Match'
        ELSE 'Calendar Drift'
    END AS calendar_status
FROM salary_calendar;

level 2:

1. SELECT
    emp_id,
    CONCAT(UPPER(LEFT(emp_name,1)), LOWER(SUBSTRING(emp_name,2))) AS emp_name,
    CASE
        WHEN DAYNAME(login_time) IN ('Saturday','Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    ROUND(TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60, 2) AS working_hours,
    CASE
        WHEN DAYNAME(login_time) NOT IN ('Saturday','Sunday')
             AND TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60 >= 8 THEN 'Good Performer'
        WHEN DAYNAME(login_time) NOT IN ('Saturday','Sunday')
             AND TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60 < 6 THEN 'Bad Performer'
        ELSE 'Weekend Login'
    END AS performance_status
FROM employee_login;

2. SELECT
    emp_id,
    UPPER(emp_name) AS emp_name,
    login_date,
    CASE
        WHEN login_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE() THEN 'Last 7 Days'
        ELSE 'Old Record'
    END AS date_status,
    CASE
        WHEN DAYNAME(login_date) IN ('Saturday','Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 AS working_hours,
    CASE
        WHEN login_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
             AND TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 >= 8 THEN 'Active & Productive'
        WHEN login_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
             AND TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 < 8 THEN 'Active but Low Hours'
        ELSE 'Absent from Last 7 Days'
    END AS productivity_status
FROM attendance_log;

3. SELECT
    emp_id,
    LOWER(emp_name) AS emp_name,
    DAYNAME(work_date) AS work_day,
    TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 AS working_hours,
    CEIL(TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600) AS ceil_hours,
    CASE
        WHEN DAYNAME(work_date) IN ('Saturday','Sunday')
             AND TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 >= 8 THEN 'Weekend Overtime'
        WHEN DAYNAME(work_date) IN ('Saturday','Sunday')
             AND TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 < 4 THEN 'Suspicious Login'
        ELSE 'Normal Working Day'
    END AS work_status
FROM weekend_monitor;

4. SELECT
    emp_id,
    emp_name,
    HOUR(login_datetime) AS login_hour,
    TRUNCATE(TIMESTAMPDIFF(MINUTE, login_datetime, logout_datetime) / 60, 1) AS working_hours,
    DAYNAME(login_datetime) AS weekday_name,
    CASE
        WHEN DAYNAME(login_datetime) NOT IN ('Saturday','Sunday')
             AND TIME(login_datetime) < '09:00:00'
             AND TIMESTAMPDIFF(MINUTE, login_datetime, logout_datetime) / 60 >= 8 THEN 'Disciplined'
        WHEN DAYNAME(login_datetime) NOT IN ('Saturday','Sunday')
             AND TIME(login_datetime) > '10:00:00' THEN 'Late Comer'
        ELSE 'Poor Discipline'
    END AS discipline_status
FROM login_discipline;

5. SELECT
    emp_id,
    emp_name,
    CASE
        WHEN work_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE() THEN 'Last 7 Days'
        ELSE 'Old Record'
    END AS date_status,
    CASE
        WHEN DAYNAME(work_date) IN ('Saturday','Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 AS total_hours,
    FLOOR(TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600) AS floor_hours,
    CASE
        WHEN work_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
             AND DAYNAME(work_date) NOT IN ('Saturday','Sunday')
             AND TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 >= 8 THEN 'Consistent Performer'
        WHEN TIME_TO_SEC(TIMEDIFF(logout_time, login_time)) / 3600 < 6 THEN 'Irregular Performer'
        ELSE 'Absent / Old Record'
    END AS performance_status
FROM performance_tracker;
