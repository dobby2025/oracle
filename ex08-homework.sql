-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회하기
SELECT e.last_name, m.last_name AS manager_last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;

-- 2. 각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3. 각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기
SELECT d.department_name, AVG(e.salary) AS AVG_SALARY
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 4. 각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회하기
SELECT d.department_name, MAX(e.salary) AS MAX_SALARY
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
;



