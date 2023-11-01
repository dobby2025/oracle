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
    






        




