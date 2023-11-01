/*
���ϸ�: ex16-PL.sql

PL/SQL (Procedual Language extension to SQL)
    SQL�� Ȯ���� ������ ��� �Դϴ�.
    ���� SQL�� �ϳ��� ���(block)���� �����Ͽ� SQL������ �� �ֽ��ϴ�.
    
���ν���(Procedure)
    �����ͺ��̽����� ���డ���� �ϳ��̻��� SQL���� ��� �ϳ���
    ���� �۾������� ���� �����ͺ��̽� ��ü�Դϴ�.
*/

/*
�͸� ���ν��� -- ��ȸ�� ���ν��� DB�� ������� �ʽ��ϴ�.
[�⺻����]
    DECLARE     -- ��������
    BEGIN       -- ó�� ���� ����
    EXCEPTION   -- ����ó��
    END         -- ó�� ���� ����
*/

-- �������� ����ϵ��� ����
SET SERVEROUTPUT ON;

-- ��ũ��Ʈ ��� �ð��� ����ϵ��� ����
SET TIMING ON;

DECLARE     -- ���� ����
    V_STRD_DT       VARCHAR2(8);
    V_STRD_DEPTNO   NUMBER;
    V_DEPTNO        NUMBER;
    V_DNAME         VARCHAR2(50);
    V_LOC           VARCHAR2(50);
    V_RESULT_MSG    VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN       -- ���� ����
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    V_STRD_DEPTNO := 10;
    
    SELECT T1.department_id
         , T1.department_name
         , T1.location_id
      INTO V_DEPTNO
         , V_STRD_DEPTNO
         , V_LOC
    FROM departments T1
    WHERE T1.department_id = V_STRD_DEPTNO;
    -- ��ȸ ��� ���� ����
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    -- ��ȸ ��� ���
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
EXCEPTION 
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    WHEN OTHERS THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END;
/
-- �۾�����
 
/*
���ν���
[�⺻����]
CREATE OR REPLACE PROCEDURE ���ν����̸� (�Ű�����1, �Ű�����2...)
    IS[AS]
        [�����]
    BEGIN
        [�����]
    [EXCEPTION]
        [EXCEPTION ó��]
    END;
    /

*/

CREATE OR REPLACE PROCEDURE print_hello_proc    -- �Ű����� ������ () ��������
    IS  -- ���ν��� ����� 
        msg VARCHAR2(20) := 'hello world';  -- ���� �ʱⰪ ����
    BEGIN   -- ���ν��� ���๮ �ۼ�
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
/

EXEC print_hello_proc;

/*
IN �Ű�����
    ���� ���ν��� ������ ��
*/
CREATE TABLE emp2 AS
SELECT employee_id empno, last_name name, salary, department_id deptno
FROM employees;

SELECT * FROM emp2;

CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER)
    IS
    BEGIN
        UPDATE emp2 SET
        salary = salary * 1.1
        WHERE empno = eno;
        
        COMMIT;
    END;
/
-- 3100 -> 3410 -> 3751
SELECT * FROM emp2
WHERE empno = 115;

EXEC update_emp_salary_proc(115);


/*
OUT �Ű�����
    ���ν����� ��ȯ���� �����Ƿ� OUT �Ű������� ���� ���� �� �ִ�.    
*/
CREATE OR REPLACE PROCEDURE find_emp_proc(v_eno IN NUMBER,
    v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER)
    IS
    BEGIN
        SELECT first_name, last_name, salary
        INTO v_fname, v_lname, v_sal
        FROM employees WHERE employee_id = v_eno;
    END;
/

VARIABLE v_fname NVARCHAR2(25);
VARIABLE v_lname NVARCHAR2(25);
VARIABLE v_sal NUMBER;

EXECUTE find_emp_proc(115, :v_fname, :v_lname, :v_sal);
PRINT v_fname;
PRINT v_lname;
PRINT v_sal;

        
        










    
    
    
    
    
    
    
    








