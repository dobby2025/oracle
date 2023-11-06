/*
���ϸ�: ex19-DCL.sql

DCL(Data Control Language)
    DCL�� ���̺� �����͸� ������ �� �ʿ��� ������ �����ϴ� ��ɾ�
    
���� Ű����
    CONNECT : �����ͺ��̽��� �����ϴ� ������ �����մϴ�.
    RESOUCE : ���̺�, ������ ���ν��� ���� ������ �� �ִ� ���� �ο��մϴ�.
    ALTER, DROP : ��ü ���� �Ǵ� ���� ������ �����մϴ�.
    DBA : �����ͺ��̽� �����ڷμ� �ý����� ������ �� �ִ� ������ �ο��մϴ�.
*/

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

-- ����� �����ϱ�, scott/tiger ���� ����
CREATE USER scott IDENTIFIED BY tiger;

-- GRANT ���� �����ֱ�
GRANT CREATE SESSION TO scott;  -- ����Ŭ 11g ����
GRANT CONNECT TO scott;         -- ���� ����ȣȯ ��밡��

-- REVOKE ���� ���� �����ϱ�
REVOKE CREATE SESSION FROM scott;
REVOKE CONNECT FROM scott;

-- OBJECT ���� �ֱ�
GRANT CREATE SEQUENCE TO scott;
GRANT CREATE SYNONYM TO scott;
GRANT CREATE TABLE TO scott;
GRANT CREATE PROCEDURE TO scott;
GRANT CREATE VIEW TO scott;

-- ��� �����ֱ�
GRANT CONNECT, DBA, RESOURCE TO scott;

-- ���� �����ϱ�
REVOKE CONNECT, DBA, RESOURCE FROM scott;

-- ����� ��й�ȣ ����
ALTER USER scott IDENTIFIED BY tiger2;


-- ����ڿ��� SELECT, INSERT, UPDATE, DELETE ���Ѻο�
GRANT SELECT ON employees TO scott;
GRANT INSERT ON orders TO scott;
GRANT UPDATE ON products TO scott;
GRANT DELETE ON customers TO scott;

-- ��� ���̺� ���� DML ���Ѻο�
SELECT 'GRANT SELECT,INSERT,DELETE, UPDATE ON hr.' || table_name || ' TO scott;' 
FROM all_tables 
WHERE OWNER = 'HR'
;

/*
ROLE - ���� �׷�
*/

-- role �����ϱ�
CREATE ROLE role01;

-- role ���� �Ҵ�
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

-- ����ڿ��� role �ο�
GRANT role01 TO scott;
REVOKE role01 FROM scott;

-- ����� �����ϱ�
DROP USER scott;
DROP USER scott CASCADE;






















