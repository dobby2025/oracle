-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�
SELECT e.last_name, m.last_name AS manager_last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�
SELECT d.department_name, AVG(e.salary) AS AVG_SALARY
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�
SELECT d.department_name, MAX(e.salary) AS MAX_SALARY
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
;



