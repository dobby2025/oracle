/*
���ϸ�: ex17-PL-Function.sql

�Լ�(Function)
    Ư�� ��ɵ��� ���ȭ, ������ �� �ְ� ������ �������� �����ϰ� ����� �ֽ��ϴ�.
    
[�⺻����]
CREATE OR REPLACE FUNCTION �Լ��̸� (�Ű�����1, �Ű�����2 ...)
RETURN datatype -- ��ȯ�Ǵ� ���� ����
    IS[AS]  -- �����
    BEGIN
        [�����]
    [EXCEPTION]
        [EXCEPTION ó��]
    
    RETURN ����;
    END;
*/

-- �μ� �̸� �˻��ϴ� �Լ�
CREATE OR REPLACE FUNCTION fn_get_dept_name(p_dept_no NUMBER)
RETURN VARCHAR2
    IS 
        V_TEST_NAME VARCHAR2(30);
    BEGIN
        SELECT department_name
        INTO   V_TEST_NAME
        FROM   departments
        WHERE department_id = p_dept_no;
    
    RETURN V_TEST_NAME;
    END;
/

SELECT fn_get_dept_name(30) FROM dual;

-- �μ��� ��� �޿��� ����ϴ� �Լ�
CREATE OR REPLACE FUNCTION calculate_department_avg_salary(department_id NUMBER)
RETURN NUMBER
    IS
        V_avg_salary NUMBER := 0;
    BEGIN
        SELECT AVG(salary) 
        INTO   v_avg_salary
        FROM employees
        WHERE department_id = department_id;        
    RETURN v_avg_salary;    
    END;
/


SELECT AVG(salary) 
FROM employees
WHERE department_id = 20;
SELECT calculate_department_avg_salary(20) FROM dual;
    






        




