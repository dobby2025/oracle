/*
���ϸ�: ex03-select-orderby.sql

ORDER BY ��
    ORDER BY ���� ����Ͽ� �˻��� ���� �����մϴ�.
        ASC : ��������, �⺻��
        DESC : ��������
    SELECT ���� �� �������� �ɴϴ�.
*/
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date; -- RR ����, MM ��, DD ��

-- �������� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- �� alias�� �������� ����
SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal;

-- �� ���� ��ġ�� ����Ͽ� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

-- ���� ���� �������� ����
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;
















