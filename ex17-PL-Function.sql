/*
파일명: ex17-PL-Function.sql

함수(Function)
    특정 기능들을 모듈화, 재사용할 수 있게 복잡한 쿼리문을 간결하게 만들수 있습니다.
    
[기본구조]
CREATE OR REPLACE FUNCTION 함수이름 (매개변수1, 매개변수2 ...)
RETURN datatype -- 반환되는 값의 유형
    IS[AS]  -- 선언부
    BEGIN
        [실행부]
    [EXCEPTION]
        [EXCEPTION 처리]
    
    RETURN 변수;
    END;
*/

-- 부서 이름 검색하는 함수
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

-- 부서의 평균 급여를 계산하는 함수
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
트리거(Trigger)
    데이터베이스에서 특정 이벤트가 발생할 때
    자동으로 실행되는 저장된 PL/SQL 프로그램입니다.
    
Before Trigger (이전 트리거)
    이전 트리거는 특정 이벤트(예: 행 삽입, 업데이트, 삭제)가 발생하기 전에 실행됩니다.
    
After Triger (이후 트리거)
    이후 트리거는 특정 이벤트(예: 행 삽입, 업데이트, 삭제)가 발생한 후에 실행됩니다.
    
:OLD와 :NEW
    트리거는 :OLD와 :NEW라고 하는 가상 레코드를 사용하여 데이터 변경에 
    대한 정보를 제공합니다.
    
    :OLD
        이전 행 값을 나타내는 가상 레코드입니다.
        업데이트 또는 삭제 이벤트에서 현재 데이터베이스의 이전 상태를 나타냅니다.
    :NEW
        새로운 행 값을 나타내는 가상 레코드입니다.
        삽입 또는 업데이트 이벤트에서 새로운 데이터를 나타냅니다.
    
*/

CREATE TABLE emp_audit_log (
    empno NUMBER,
    action VARCHAR2(25),
    log_date DATE
);

SELECT * FROM emp_audit_log;
SELECT * FROM emp;

-- 직원이 새로 추가될 때 로그를 기록하는 트리거
CREATE OR REPLACE TRIGGER emp_insert_log
AFTER INSERT ON emp
FOR EACH ROW    -- 해당 트리거가 각 행의 변경에 대해 실행되도록 지정하는 역할
BEGIN
    INSERT INTO emp_audit_log (empno, action, log_date)
    VALUES (:NEW.empno, 'INSERT', SYSDATE);
END;
/

-- EMP 테이블 INSERT 하기 트리거 테스트!
INSERT INTO emp (empno, ename, deptno)
VALUES (3, '김민재', 3);
COMMIT;


SELECT * FROM emp;
SELECT * FROM emp_audit_log;


ROLLBACK;

    






        




