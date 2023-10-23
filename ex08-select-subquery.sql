/*
파일명: ex08-select-subquery.sql

Subquery 구문
    SELECT 문의 포함되는 SELECT 문 입니다.
*/

-- 단일 행 Subquery  - 스칼라(Scalar Subquery) 서브쿼리
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');

-- Subquery에서 그룹 함수 사용
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

/*
여러 행 Subquery - RowSubquery 또는 TableSubquery
    IN 
        리스트의 임의  멤버와 같음
    ANY
        =, <>, >, <, <=, >= 연산자가 앞에 있어야 합니다.
        < ANY는 최대값보다 작음을 의미합니다.
        > ANY는 최소값보다 큼을 의미합니다.
        = ANY는 IN과 같습니다.
    ALL
        > ALL은 최대값보다 큼을 의미합니다.
        < ALL은 최소값보다 작음을 의미합니다.
  
*/
-- 9000, 6000, 4800, 4200
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
;

/*
EXISTS 연산자
    subquery에서 최소한 한 개의 행을 반환하면 TRUE로 평가됩니다.
*/

-- 상관서브쿼리(CorrelatedSubquery)
SELECT * FROM departments
WHERE NOT EXISTS 
        (SELECT * FROM employees
        WHERE employees.department_id = departments.department_id);
   
SELECT * FROM departments
WHERE department_id NOT IN
        (SELECT department_id FROM employees 
        WHERE employees.department_id = departments.department_id);
        
/*
Subquery의 null 값
    반환되는 값 중 하나가 null 값이면 전체 query가 행을 반환하지 않습니다.
    null 값을 비교하는 모든 조건은 결과가 null이기 때문입니다.
*/
SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN 
                (SELECT mgr.manager_id FROM employees mgr
                 WHERE mgr.manager_id IS NOT NULL
                );


SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN 
                (null, 100, 102, 103); 
                
SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id <> NULL
AND emp.employee_id <> 100
AND emp.employee_id <> 102
AND emp.employee_id <> 103
;



/*
인라인 뷰 서브쿼리(Inline View Subquery)
    서브쿼리를 임시 테이블뷰로 사용하는 서브쿼리
*/
SELECT e.employee_id, e.last_name, d.department_name, d.department_id
FROM employees e 
JOIN (SELECT 
            department_id, department_name 
        FROM departments
       WHERE department_id < 50
    ) d
ON e.department_id = d.department_id
;

-- 스칼라 상관서브쿼리
SELECT e.employee_id 
     ,e.last_name 
     ,e.department_id
     ,(SELECT d.department_name 
        FROM departments d 
        WHERE d.department_id = e.department_id) AS department_name
FROM employees e
;
commit;
        











        













