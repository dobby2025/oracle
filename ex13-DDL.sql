/*
파일명: ex13-DDL.sql
DDL(Data Definition Language) - 데이터 정의어
    데이터베이스 내의 구조 및 객체(테이블, 시퀀스.. 등)를 생성, 변경,
    삭제하기 위해 사용되는 SQL문입니다.
*/

/*
CREATE TABLE 문
    데이터를 저장할 테이블을 생성합니다.
*/
CREATE TABLE dept (
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
);

SELECT SYSDATE FROM dual;

SELECT * FROM dept;

INSERT INTO dept (deptno, dname, loc)
VALUES (2, '부서1', '서울');

ROLLBACK;
DESC dept;

/*
데이터 유형
    VARCAHR2(size) 가변 길이 문자 데이터 MAX(4000)
    NVARCHAR2(글자수) 가변 길이 문자 데이터 글자수 사이즈 이다. MAX(2000)
    NUMBER(p,s) 가변 길이 숫자 데이터
    CHAR(size) 고정 길이 문자 MAX(2000)
    DATE 날짜 및 시간 값 
    CLOB 문자 데이터 (최대 4GB)
    BLOB 바이너리 데이터 (최대 4GB)  
*/

-- departments 테이블을 dept에 데이터 복사하기
INSERT INTO dept
SELECT department_id, department_name, location_id, SYSDATE
FROM departments;
COMMIT;
SELECT * FROM dept;

/*
CTAS "Create Taable As Select"의 약자로
데이터베이스에서 새로운 테이블을 생성하는 기법입니다.
이 기법은 기존 테이블에서 SELECT문을 사용하여 데이터를 조회한 후,
그 결과를 새로운 테이블로 생성하는 방법입니다.
*/
-- 테이블 복사하기 => 제약조건은 복사가 안된다.
CREATE TABLE dept2 AS
SELECT * FROM dept;

SELECT * FROM dept2;

-- 테이블 구조만 복사하기 
CREATE TABLE dept3 AS
SELECT * FROM dept WHERE 1=2;

SELECT * FROM dept3;

CREATE TABLE dept4 (
    deptno NUMBER(6),
    dname NVARCHAR2(2000),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
);

/*
ALTER 문
    데이터베이스 객체 구조나 속성을 변경할 때 사용되는 SQL 명령문 입니다.
*/
CREATE TABLE simple(num NUMBER);

SELECT * FROM simple;

-- 컬럼 추가하기
ALTER TABLE simple ADD(name VARCHAR2(3));

-- 컬럼 수정하기
ALTER TABLE simple MODIFY(name VARCHAR2(30));
DESC simple;

-- 컬럼 삭제하기
ALTER TABLE simple DROP COLUMN name;

ALTER TABLE simple ADD(addr VARCHAR2(50));
-- 컬럼 삭제하기2
ALTER TABLE simple DROP(addr);

DESC simple;

/*
DROP 문
    객체를 삭제할 때 사용되는 SQL명령문 입니다.

*/

































