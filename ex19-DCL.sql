/*
파일명: ex19-DCL.sql

DCL(Data Control Language)
    DCL은 테이블에 데이터를 조작할 때 필요한 권한을 조작하는 명령어
    
관련 키워드
    CONNECT : 데이터베이스에 접속하는 권한을 제공합니다.
    RESOUCE : 테이블, 시퀀스 프로시저 등을 생성할 수 있는 권한 부여합니다.
    ALTER, DROP : 객체 변경 또는 삭제 권한을 제공합니다.
    DBA : 데이터베이스 관리자로서 시스템을 제어할 수 있는 권한을 부여합니다.
*/

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

-- 사용자 생성하기, scott/tiger 계정 생성
CREATE USER scott IDENTIFIED BY tiger;

-- GRANT 접속 권한주기
GRANT CREATE SESSION TO scott;  -- 오라클 11g 가능
GRANT CONNECT TO scott;         -- 버전 하위호환 사용가능

-- REVOKE 접속 권한 해제하기
REVOKE CREATE SESSION FROM scott;
REVOKE CONNECT FROM scott;

-- OBJECT 권한 주기
GRANT CREATE SEQUENCE TO scott;
GRANT CREATE SYNONYM TO scott;
GRANT CREATE TABLE TO scott;
GRANT CREATE PROCEDURE TO scott;
GRANT CREATE VIEW TO scott;

-- 모든 권한주기
GRANT CONNECT, DBA, RESOURCE TO scott;

-- 권한 해제하기
REVOKE CONNECT, DBA, RESOURCE FROM scott;

-- 사용자 비밀번호 변경
ALTER USER scott IDENTIFIED BY tiger2;


-- 사용자에게 SELECT, INSERT, UPDATE, DELETE 권한부여
GRANT SELECT ON employees TO scott;
GRANT INSERT ON orders TO scott;
GRANT UPDATE ON products TO scott;
GRANT DELETE ON customers TO scott;

-- 모든 테이블에 대한 DML 권한부여
SELECT 'GRANT SELECT,INSERT,DELETE, UPDATE ON hr.' || table_name || ' TO scott;' 
FROM all_tables 
WHERE OWNER = 'HR'
;

/*
ROLE - 권한 그룹
*/

-- role 생성하기
CREATE ROLE role01;

-- role 권한 할당
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

-- 사용자에게 role 부여
GRANT role01 TO scott;
REVOKE role01 FROM scott;

-- 사용자 삭제하기
DROP USER scott;
DROP USER scott CASCADE;






















