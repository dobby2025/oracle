/*
���ϸ�: ex07-select-join.sql

***** JOIN
    SQL���� �� �� �̻��� ���̺��� ���õ� ����� �����ϱ� ���� �����Դϴ�.
*/
/*
Natural Join
    �� ���̺��� ������ ������ �̸��� ��ġ�ϴ� ���� ������� �ڵ�����
    ���̺��� ������ �� �ֽ��ϴ�.
*/
SELECT department_id, department_name,
        location_id, city
FROM departments
NATURAL JOIN locations
;


/*
USING ���� ����
    ��������� ������ �����ϰ����ϴ� ���� �����ݴϴ�.
*/
SELECT employee_id, last_name,
        location_id, department_id, department_name
FROM employees JOIN departments
USING (department_id)
;

/*
ON ���� ����
    ON ���� ����Ͽ� ���� ������ �����մϴ�.
*/
SELECT e.employee_id, e.last_name,
    e.department_id, d.department_name, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
;

SELECT e.employee_id, e.last_name,
    e.department_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
;

-- ON �� ����Ͽ� 3-Way ����
SELECT e.employee_id, e.last_name, e.first_name, e.department_id,
    d.department_name, l.city
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
;


SELECT a.employee_id FROM employees a;


SELECT e.employee_id, e.last_name, e.first_name, 
    d.department_name, d.location_id, l.city
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
;


SELECT * FROM departments;

SELECT * FROM locations;




















