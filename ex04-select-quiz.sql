/*
파일명: ex04-select-quiz.sql

1. "employees" 테이블에서 모든 직원들의 성(last_name), 이름(first_name)및 급여(salary)를 조회하세요.
    
2. "employees" 테이블에서 급여(salary)가 5000 이상인 직원들의 이름(first_name)과 급여(salary)를 조회하세요.

3. "employees" 테이블에서 근무 시작일(hire_date)이 2005년 이후인 직원들의 이름(first_name)과 
    근무 시작일(hire_date)을 조회하세요.
    
*/
-- 1. 
SELECT last_name, first_name, salary
FROM employees;

-- 2.  "employees" 테이블에서 급여(salary)가 5000 이상인 직원들의 이름(first_name)과 급여(salary)를 조회하세요.
SELECT first_name, salary
FROM employees
WHERE salary >= 5000;

-- 3. "employees" 테이블에서 근무 시작일(hire_date)이 2005년 이후인 직원들의 이름(first_name)과 
-- 근무 시작일(hire_date)을 조회하세요.
SELECT first_name, hire_date
FROM employees
WHERE hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
ORDER BY hire_date;










