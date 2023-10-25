/*
���ϸ�: ex11-select-set.sql

���� ������
    ���� ���̺� �Ǵ� ������ ����� �����ϰ� �����ϴ� ������.
    SELECT ����Ʈ�� ǥ������ �÷� ������ ��ġ�ؾ� �մϴ�.
    ������ ������ ��ġ�ؾ� �մϴ�.
    
    UNION, UNION ALL, INTERSECT, MINUS
*/
-- UNION ������ : �ΰ��� ������ ��ġ��, �ߺ��� ���� �����մϴ�.
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROm job_history
ORDER BY employee_id
;

-- UNION ALL ������ : �� ���� ���� ����� ��ġ��, �ߺ��� ���� �����Ͽ� ��� ��ȯ�մϴ�.
SELECT employee_id, job_id
FROM employees
UNION ALL 
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id
;

-- INTERSECT ������ : �� ���� ���� ��� �߿��� ����� �ุ ��ȯ �մϴ�.
-- ����> JOIN���� ���� ��� ������ �ϱ�
SELECT employee_id, job_id
FROM employees
INTERSECT 
SELECT employee_id, job_id
FROM job_history
;

-- MINUS ������: ù��° ���� ��� �߿��� �ι�° ���� ����� �������� �ʴ� �ุ ��ȯ�մϴ�.
SELECT employee_id, job_id
FROM employees
MINUS 
SELECT employee_id, job_id
FROM job_history
;


DESC employees;

-- ������ ���� ��ġ���Ѿ� �մϴ�.
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












