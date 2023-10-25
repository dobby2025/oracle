/*
파일명: ex11-select-set.sql

집합 연산자
    여러 테이블 또는 집합의 결과를 조합하고 조작하는 연산자.
    SELECT 리스트의 표현식은 컬럼 개수가 일치해야 합니다.
    데이터 유형도 일치해야 합니다.
    
    UNION, UNION ALL, INTERSECT, MINUS
*/
-- UNION 연산자 : 두개의 쿼리를 합치고, 중복된 행을 제거합니다.
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROm job_history
ORDER BY employee_id
;

-- UNION ALL 연산자 : 두 개의 쿼리 결과를 합치고, 중복된 행을 포함하여 모두 반환합니다.
SELECT employee_id, job_id
FROM employees
UNION ALL 
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id
;

-- INTERSECT 연산자 : 두 개의 쿼리 결과 중에서 공통된 행만 반환 합니다.
-- 숙제> JOIN으로 같은 결과 나오게 하기
SELECT employee_id, job_id
FROM employees
INTERSECT 
SELECT employee_id, job_id
FROM job_history
;

-- MINUS 연산자: 첫번째 쿼리 결과 중에서 두번째 쿼리 결과에 존재하지 않는 행만 반환합니다.
SELECT employee_id, job_id
FROM employees
MINUS 
SELECT employee_id, job_id
FROM job_history
;


DESC employees;

-- 데이터 유형 일치시켜야 합니다.
SELECT location_id, department_name AS "Department", ' ' "Warehouse location"
FROM departments
UNION 
SELECT location_id, ' ' AS "Deparment", state_province
FROM locations;

DESC employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 60
UNION ALL 
SELECT 108, 'KIM', 60 
FROM dual
;












