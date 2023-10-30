-- ���տ����� ����!!!
-- ����> JOIN���� ���� ��� ������ �ϱ�

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





-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ��(last_name) 
--  �� �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name, m.last_name, d.department_name
FROM employees e 
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id;


-- 2. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �Ŵ����� ��(last_name) ��ȸ�ϱ�

SELECT A.last_name AS E_LAST_NAME, B.last_name AS M_LAST_NAME
FROM (
    SELECT e.last_name, d.manager_id
    FROM employees e JOIN departments d
    ON e.department_id = d.department_id
) A
JOIN employees B ON A.manager_id = B.employee_id
;


/*
3. �� �μ��� �̸�(department_name), 
    �ش� �μ��� �Ŵ����� ID(manager_id)��
    �Ŵ����� ��(last_name),
   ������ ID(employee_id), ������ ��(last_name), 
   �׸��� �ش� ������ �޿�(salary) ��ȸ�ϱ�.
   WHERE
   �������� �޿�(salary)�� �ش� �μ��� ��� �޿����� ���� �������� ��ȸ�մϴ�.
   ORDERBY
   ����� �μ� �̸��� ������ �޿��� ���� ������ ���ĵ˴ϴ�. 
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


    
    




