/* 
파일명: ex06-function-group.sql

여러행 그룹 함수

    AVG() - 평균
    MAX() - 최대값
    MIN() - 최소값
    SUM() - 합계
*/
SELECT AVG(salary) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary,
        SUM(salary) AS sum_salary
FROM employees
WHERE job_id LIKE '%REP%';

-- COUNT() 함수 - null 값이 아닌 모든 행의 개수를 반환 합니다.
SELECT COUNT(*) AS total_employees
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct) AS non_null_commission_count
FROM employees
WHERE department_id = 50;

-- COUNT(DISTINCT expr)은 특정 표현식을 기준으로 중복을 제거한 행의 개수 반환합니다.
SELECT COUNT(DISTINCT department_id) AS distinct_department_count
FROM employees;

-- NVL 함수를 활용하여 NULL 값을 다른값으로 대체한 후 AVG() 함수 사용
SELECT AVG(NVL(commission_pct, 0)) AS avg_commission
FROM employees;




































    









