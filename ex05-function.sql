/*
���ϸ�: ex05-function.sql

�Լ�(Function)
    �Ű�����(����)�� �޾� Ư�� ���(�۾�)�� �����ϰ� 
    ����� ��ȯ�ϴ� ������ �Ǿ� �ִ�.

�Լ� ����
    ������ �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
    ������(�׷�) �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
*/
-- ������ �Լ�

-- ��ҹ��� ��ȯ �Լ�
-- LOWER() �Լ� - ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- UPPER() �Լ� - ���ڿ��� �빮�ڷ� ��ȯ.
SELECT UPPER('higgins') FROM dual;

-- INITCAP() �Լ� - ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = INITCAP('higgins');

SELECT INITCAP('higgins') FROM dual;









