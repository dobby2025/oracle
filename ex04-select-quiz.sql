/*
���ϸ�: ex04-select-quiz.sql

1. "employees" ���̺��� ��� �������� ��(last_name), �̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ���.
    
2. "employees" ���̺��� �޿�(salary)�� 5000 �̻��� �������� �̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ���.

3. "employees" ���̺��� �ٹ� ������(hire_date)�� 2005�� ������ �������� �̸�(first_name)�� 
    �ٹ� ������(hire_date)�� ��ȸ�ϼ���.
    
*/
-- 1. 
SELECT last_name, first_name, salary
FROM employees;

-- 2.  "employees" ���̺��� �޿�(salary)�� 5000 �̻��� �������� �̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ���.
SELECT first_name, salary
FROM employees
WHERE salary >= 5000;

-- 3. "employees" ���̺��� �ٹ� ������(hire_date)�� 2005�� ������ �������� �̸�(first_name)�� 
-- �ٹ� ������(hire_date)�� ��ȸ�ϼ���.
SELECT first_name, hire_date
FROM employees
WHERE hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
ORDER BY hire_date;










