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
CREATE OR REPLACE FUNCTION calculate_department_avg_salary(deptno NUMBER)
RETURN NUMBER
    IS
        V_avg_salary NUMBER;
    BEGIN
        SELECT AVG(salary) 
        INTO   v_avg_salary
        FROM employees
        WHERE department_id = deptno;        
    RETURN v_avg_salary;    
    END;
/

SELECT calculate_department_avg_salary(10) FROM dual;

/*
Ʈ����(Trigger)
    �����ͺ��̽����� Ư�� �̺�Ʈ�� �߻��� ��
    �ڵ����� ����Ǵ� ����� PL/SQL ���α׷��Դϴ�.
    
Before Trigger (���� Ʈ����)
    ���� Ʈ���Ŵ� Ư�� �̺�Ʈ(��: �� ����, ������Ʈ, ����)�� �߻��ϱ� ���� ����˴ϴ�.
    
After Triger (���� Ʈ����)
    ���� Ʈ���Ŵ� Ư�� �̺�Ʈ(��: �� ����, ������Ʈ, ����)�� �߻��� �Ŀ� ����˴ϴ�.
    
:OLD�� :NEW
    Ʈ���Ŵ� :OLD�� :NEW��� �ϴ� ���� ���ڵ带 ����Ͽ� ������ ���濡 
    ���� ������ �����մϴ�.
    
    :OLD
        ���� �� ���� ��Ÿ���� ���� ���ڵ��Դϴ�.
        ������Ʈ �Ǵ� ���� �̺�Ʈ���� ���� �����ͺ��̽��� ���� ���¸� ��Ÿ���ϴ�.
    :NEW
        ���ο� �� ���� ��Ÿ���� ���� ���ڵ��Դϴ�.
        ���� �Ǵ� ������Ʈ �̺�Ʈ���� ���ο� �����͸� ��Ÿ���ϴ�.
    
*/

CREATE TABLE emp_audit_log (
    empno NUMBER,
    action VARCHAR2(25),
    log_date DATE
);

SELECT * FROM emp_audit_log;
SELECT * FROM emp;

-- ������ ���� �߰��� �� �α׸� ����ϴ� Ʈ����
CREATE OR REPLACE TRIGGER emp_insert_log
AFTER INSERT ON emp
FOR EACH ROW    -- �ش� Ʈ���Ű� �� ���� ���濡 ���� ����ǵ��� �����ϴ� ����
BEGIN
    INSERT INTO emp_audit_log (empno, action, log_date)
    VALUES (:NEW.empno, 'INSERT', SYSDATE);
END;
/

-- EMP ���̺� INSERT �ϱ� Ʈ���� �׽�Ʈ!
INSERT INTO emp (empno, ename, deptno)
VALUES (3, '�����', 3);
COMMIT;


SELECT * FROM emp;
SELECT * FROM emp_audit_log;


ROLLBACK;

    






        




