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
DROP TABLE simple;

DESC simple;


/*
제약조건(Constraint)
    테이블의 해당컬럼에 원하지 않는 데이터를 입력/수정/삭제 되는 것을 방지하기 위해
    테이블 생성 또는 변경시 설정하는 조건입니다. 
    (저장된 데이터의 신뢰성 높이기위함)
    
    NOT NULL
        NULL로 입력이 되어서는 안되는 컬럼에 부여하는
        조건으로 컬럼 레벨에서만 부여할 수 있는 제약조건입니다.
    UNIQUE KEY(유일키)
        저장된 값이 중복되지 않고 오직 유일하게 유지되어야 할 때
        사용하는 제약조건입니다.(NULL 허용된다)
    PRIMARY KEY(대표키, 기본키)
        NOT NULL 조건과 UNIQUE KEY를 합친 조건입니다.
    CHECK
        조건에 맞는 데이터만 입력되도록 조건을 부여하는 제약조건입니다.
    FOREIGN KEY(외래키, 참조키)
        부모 테이블의 PRIMARY KEY를 참조하는 컬럼에 붙이는 제약조건입니다.
*/

DROP TABLE dept4;
CREATE TABLE dept4(
    deptno NUMBER(2) CONSTRAINT dept4_deptno_pk PRIMARY KEY,
    dname VARCHAR2(15) DEFAULT '영업부',
    loc CHAR(1) CONSTRAINT dept4_loc_ck CHECK(loc IN('1','2'))
);

SELECT * FROM dept4;
INSERT INTO dept4(deptno, loc)
VALUES (5, '3');


/*
외래키를 만들기 위해 부모테이블 생성
*/
CREATE TABLE dept5(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR(15) NOT NULL
);

-- 부모테이블 dept5를 참조하는 자식 테이블
CREATE TABLE emp (
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(15) NOT NULL,
    deptno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY (deptno) 
    REFERENCES dept5(deptno)
);

SELECT * FROM dept5;
INSERT INTO dept5 (deptno, dname) VALUES (1, '개발부');
INSERT INTO dept5 (deptno, dname) VALUES (2, '기획부');
INSERT INTO dept5 (deptno, dname) VALUES (3, '디자인');
COMMIT;

SELECT * FROM emp;
INSERT INTO emp (empno, ename, deptno) VALUES (1, '손흥민', 1);
INSERT INTO emp (empno, ename, deptno) VALUES (2, '이강인', 2);

COMMIT;

DELETE FROM emp WHERE empno = 1;
ROLLBACK;

DELETE FROM dept5 WHERE deptno = 1;

SELECT * FROM dept5;
ROLLBACK;

-- 제약조건 조회
SELECT * FROM user_constraints
WHERE constraint_name = 'EMP_DEPT5_FK'
;

SELECT * FROM user_constraints
WHERE table_name = 'EMP'
;

-- 제약조건은 수정 불가능, 삭제만 가능합니다.
ALTER TABLE emp DROP CONSTRAINT EMP_DEPT5_FK;

-- 제약조건 추가하기
ALTER TABLE emp ADD(
    CONSTRAINT emp_dept5_fk FOREIGN KEY(deptno) REFERENCES dept5(deptno)
);





























































