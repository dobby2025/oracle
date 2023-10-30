-- 집합연산자 내용!!!
-- 숙제> JOIN으로 같은 결과 나오게 하기

SELECT employee_id, job_id
FROM employees
INTERSECT 
SELECT employee_id, job_id
FROM job_history;


SELECT e.employee_id, e.job_id
FROM employees e JOIN job_history j
ON e.employee_id = j.employee_id 
AND e.job_id = j.job_id
;





-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저의 성(last_name) 
--  및 부서 이름(department_name) 조회하기
SELECT e.last_name, m.last_name, d.department_name
FROM employees e 
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id;


-- 2. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 매니저의 성(last_name) 조회하기

SELECT A.last_name AS E_LAST_NAME, B.last_name AS M_LAST_NAME
FROM (
    SELECT e.last_name, d.manager_id
    FROM employees e JOIN departments d
    ON e.department_id = d.department_id
) A
JOIN employees B ON A.manager_id = B.employee_id
;


/*
3. 각 부서의 이름(department_name), 
    해당 부서의 매니저의 ID(manager_id)와
    매니저의 성(last_name),
   직원의 ID(employee_id), 직원의 성(last_name), 
   그리고 해당 직원의 급여(salary) 조회하기.
   WHERE
   직원들의 급여(salary)가 해당 부서의 평균 급여보다 높은 직원들을 조회합니다.
   ORDERBY
   결과는 부서 이름과 직원의 급여가 높은 순으로 정렬됩니다. 
*/

SELECT d.department_name, d.manager_id, m.last_name
    ,e.employee_id AS E_EMPLOYEE_ID, 
    e.last_name AS E_LAST_NAME, 
    e.salary AS E_SALARY
FROM departments d
JOIN employees m ON d.manager_id = m.employee_id
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > (SELECT AVG(e2.salary)
                    FROM employees e2
                    WHERE e2.department_id = e.department_id)
ORDER BY d.department_name, e.salary DESC
;


    
    




