/*
���ϸ�: ex12-DML.sql

DML(Data Manipulation Language)
    DB���� �����͸� �����ϰ� ó���ϴ� SQL �Դϴ�.
    
    INSERT �� : ���̺��� ���ο� ���ڵ� ����
    UPDATE �� : ���̺��� ���� ���ڵ带 ����(������Ʈ) �ϴµ� ���
    DELETE �� : ���̺��� Ư�� ���ڵ带 ����
    
    SELECT�� DML ���Ե� �� ������, ���� DQL(Data Query Language)�� �з��մϴ�.
*/
/*
INSERT ��
[�⺻����]
    INSERT INTO ���̺�� (�÷���1, �÷���2, ... )
    VALUES(��1, ��2, ...);
    
    �Ǵ�
    
    INSERT INTO ���̺�� (�÷���1, �÷���2, ... ) subquery;
*/
SELECT * FROM departments;

INSERT INTO departments 
    (department_id, department_name, manager_id, location_id)
VALUES 
    (280, 'Public Relations', 100, 1700);
    
COMMIT; -- DML ����� ���������� DB�� �ݿ�

-- null ���� ���� �� ����
-- ������
INSERT INTO departments (department_id, department_name)
VALUES (290, 'Purchasing');
COMMIT;

-- NULL Ű���� ����
INSERT INTO departments 
VALUES (300, 'Finance', NULL, NULL);
ROLLBACK; -- DML���� �������� ����մϴ�.

DESC departments;

/* INSERT subquery */
CREATE TABLE sales_reps
AS (
    SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees 
    WHERE 1 = 2
);

SELECT * FROm sales_reps;

-- job_id 'REP' ���Ե� ��� salse_reps �߰��ϱ�
INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id AS id, last_name AS name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%'
;
COMMIT;

SELECT * FROM sales_reps;



/*
UPDATE �� - ���̺��� ���� ���� �����մϴ�.
[�⺻����]
    UPDATE ���̺��
    SET 
        �÷���1 = ������, �÷���2 = ������ ...
    WHERE ������

*/

UPDATE sales_reps 
SET 
    salary = 12000,
    commission_pct = 0.5
WHERE id = 156
;

SELECT * FROM sales_reps;
COMMIT;

UPDATE sales_reps 
SET salary = 500
WHERE salary > 10000
;

ROLLBACK;

SELECT * FROM sales_reps
--WHERE salary > 10000
;
-- 104

UPDATE sales_reps 
SET 
    salary = (SELECT salary FROM employees WHERE employee_id = 100)
WHERE salary = 
    (SELECT salary FROM employees WHERE employee_id = 104)
;
SELECT * FROM sales_reps 
WHERE id = 202 ;
commit;

/*
DELETE �� - ���̺��� ���� ���� ������ �� �ֽ��ϴ�.
*/
DELETE FROM sales_reps 
WHERE id = 202 ;

SELECT * FROM sales_reps;
ROLLBACK;
COMMIT;

/*
TRUNCATE ��
    ���̺��� �� ���·�, ���̺� ���� �״�� ���ܵ�ä ���̺��� ��� ���� �����մϴ�.
    DML ���� �ƴ϶� DDL(������ ���Ǿ�) ���̹Ƿ� ���� ����� �� �����ϴ�.
    
    ������� ������!!
*/
TRUNCATE TABLE sales_reps;

SELECT * FROM sales_reps;

/*
Ʈ�����(Transaction)
    ������ ó���� �� �����Դϴ�.
    ����Ŭ���� �߻��ϴ� ���� ���� SQL ��ɹ���
    �ϳ��� ������ �۾� ������ ó���ϴµ� �̸� 
    Ʈ������̶�� �մϴ�.
    
    COMMIT : SQL���� ����� ���������� DB�� �ݿ�
    ROLLBACK : SQL���� �������� �������
    SQVEPOINT : Ʈ������� �������� ǥ���ϴ� �ӽ� ������
*/
CREATE TABLE member (
    num NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    addr VARCHAR2(50)
)
;

INSERT INTO member VALUES(1, '��ī��', '���ʸ���');
COMMIT;
INSERT INTO member VALUES(2, '������', '���ʸ���');
INSERT INTO member VALUES(3, '���̸�', '���ʸ���');
INSERT INTO member VALUES(4, '���α�', '���ʸ���');
INSERT INTO member VALUES(5, '������', '���ʸ���');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6, '�ߵ���', '���ʸ���');
INSERT INTO member VALUES(7, '������', '���ʸ���');
INSERT INTO member VALUES(8, '�ǰ���', '���ʸ���');
ROLLBACK TO mypoint;

commit;


SELECT * FROM member;

























































