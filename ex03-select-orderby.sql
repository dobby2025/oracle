/*
파일명: ex03-select-orderby.sql

ORDER BY 절
    ORDER BY 절을 사용하여 검색된 행을 정렬합니다.
        ASC : 오름차순, 기본값
        DESC : 내림차순
    SELECT 문의 맨 마지막에 옵니다.
*/
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date; -- RR 연도, MM 월, DD 일

-- 내림차순 정렬
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- 열 alias를 기준으로 정렬
SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal;

-- 열 숫자 위치를 사용하여 정렬
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

-- 여러 열을 기준으로 정렬
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

















