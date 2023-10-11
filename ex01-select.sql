/*
���ϸ�: ex01-select.sql

SQL (Structured Query Language)
    ������ ������ ���̽� �ý��ۿ��� �ڷ� ���� �� ó���ϱ� ���� ����� ���

SELECT ��
    �����ͺ��̽����� ���� �˻� ��ɾ�
*/

-- ��� �� ���� *
SELECT * 
FROM departments;

-- Ư�� �� ���� (�������� Projection)
SELECT department_id, location_id
FROM departments;

/* 
�����
    ��������ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�

    + ���ϱ�
    - ����
    * ���ϱ�
    / ������

*/
-- ��������� ���
SELECT 
    last_name,
    salary,
    salary + 300
FROM employees;

/*
������ �켱����
    ���ϱ�� ������� ���ϱ� ���⺸�� ���� ����
*/
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
������� Null ��
    null ���� �����ϴ� ������� null�� ���
*/
SELECT last_name, 12*salary*commission_pct, 
    salary, commission_pct
FROM employees;



















