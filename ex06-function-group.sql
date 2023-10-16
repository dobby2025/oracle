/* 
���ϸ�: ex06-function-group.sql

������ �׷� �Լ�

    AVG() - ���
    MAX() - �ִ밪
    MIN() - �ּҰ�
    SUM() - �հ�
*/
SELECT AVG(salary) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary,
        SUM(salary) AS sum_salary
FROM employees
WHERE job_id LIKE '%REP%';

-- COUNT() �Լ� - null ���� �ƴ� ��� ���� ������ ��ȯ �մϴ�.
SELECT COUNT(*) AS total_employees
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct) AS non_null_commission_count
FROM employees
WHERE department_id = 50;

-- COUNT(DISTINCT expr)�� Ư�� ǥ������ �������� �ߺ��� ������ ���� ���� ��ȯ�մϴ�.
SELECT COUNT(DISTINCT department_id) AS distinct_department_count
FROM employees;

-- NVL �Լ��� Ȱ���Ͽ� NULL ���� �ٸ������� ��ü�� �� AVG() �Լ� ���
SELECT AVG(NVL(commission_pct, 0)) AS avg_commission
FROM employees;




































    









