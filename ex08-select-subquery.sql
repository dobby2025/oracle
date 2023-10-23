/*
���ϸ�: ex08-select-subquery.sql

Subquery ����
    SELECT ���� ���ԵǴ� SELECT �� �Դϴ�.
*/

-- ���� �� Subquery  - ��Į��(Scalar Subquery) ��������
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');

-- Subquery���� �׷� �Լ� ���
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

/*
���� �� Subquery - RowSubquery �Ǵ� TableSubquery
    IN 
        ����Ʈ�� ����  ����� ����
    ANY
        =, <>, >, <, <=, >= �����ڰ� �տ� �־�� �մϴ�.
        < ANY�� �ִ밪���� ������ �ǹ��մϴ�.
        > ANY�� �ּҰ����� ŭ�� �ǹ��մϴ�.
        = ANY�� IN�� �����ϴ�.
    ALL
        > ALL�� �ִ밪���� ŭ�� �ǹ��մϴ�.
        < ALL�� �ּҰ����� ������ �ǹ��մϴ�.
  
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
EXISTS ������
    subquery���� �ּ��� �� ���� ���� ��ȯ�ϸ� TRUE�� �򰡵˴ϴ�.
*/

-- �����������(CorrelatedSubquery)
SELECT * FROM departments
WHERE NOT EXISTS 
        (SELECT * FROM employees
        WHERE employees.department_id = departments.department_id);
   
SELECT * FROM departments
WHERE department_id NOT IN
        (SELECT department_id FROM employees 
        WHERE employees.department_id = departments.department_id);
        
/*
Subquery�� null ��
    ��ȯ�Ǵ� �� �� �ϳ��� null ���̸� ��ü query�� ���� ��ȯ���� �ʽ��ϴ�.
    null ���� ���ϴ� ��� ������ ����� null�̱� �����Դϴ�.
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
�ζ��� �� ��������(Inline View Subquery)
    ���������� �ӽ� ���̺��� ����ϴ� ��������
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

-- ��Į�� �����������
SELECT e.employee_id 
     ,e.last_name 
     ,e.department_id
     ,(SELECT d.department_name 
        FROM departments d 
        WHERE d.department_id = e.department_id) AS department_name
FROM employees e
;
commit;
        











        













