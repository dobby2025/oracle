/*
파일명: ex12-DML.sql

DML(Data Manipulation Language)
    DB에서 데이터를 조작하고 처리하는 SQL 입니다.
    
    INSERT 문 : 테이블에서 새로운 레코드 삽입
    UPDATE 문 : 테이블에서 기존 레코드를 갱신(업데이트) 하는데 사용
    DELETE 문 : 테이블에서 특정 레코드를 삭제
    
    SELECT는 DML 포함될 수 있지만, 보통 DQL(Data Query Language)로 분류합니다.
*/
/*
INSERT 문
[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ... )
    VALUES(값1, 값2, ...);
    
    또는
    
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ... ) subquery;
*/
SELECT * FROM departments;

INSERT INTO departments 
    (department_id, department_name, manager_id, location_id)
VALUES 
    (280, 'Public Relations', 100, 1700);
    
COMMIT; -- DML 결과를 영구적으로 DB에 반영

-- null 값을 가진 행 삽입
-- 열생략
INSERT INTO departments (department_id, department_name)
VALUES (290, 'Purchasing');
COMMIT;

-- NULL 키워드 지정
INSERT INTO departments 
VALUES (300, 'Finance', NULL, NULL);
ROLLBACK; -- DML문의 실행결과를 취소합니다.

DESC departments;

/* INSERT subquery */
CREATE TABLE sales_reps
AS (
    SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees 
    WHERE 1 = 2
);

SELECT * FROm sales_reps;

-- job_id 'REP' 포함된 사원 salse_reps 추가하기
INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id AS id, last_name AS name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%'
;
COMMIT;

SELECT * FROM sales_reps;



/*
UPDATE 문 - 테이블의 기존 값을 수정합니다.
[기본형식]
    UPDATE 테이블명
    SET 
        컬럼명1 = 수정값, 컬럼명2 = 수정값 ...
    WHERE 조건절

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
DELETE 문 - 테이블에서 기존 행을 제거할 수 있습니다.
*/
DELETE FROM sales_reps 
WHERE id = 202 ;

SELECT * FROM sales_reps;
ROLLBACK;
COMMIT;

/*
TRUNCATE 문
    테이블을 빈 상태로, 테이블 구조 그대로 남겨둔채 테이블에서 모든 행을 제거합니다.
    DML 문이 아니라 DDL(데이터 정의어) 문이므로 쉽게 언두할 수 없습니다.
    
    사용하지 마세요!!
*/
TRUNCATE TABLE sales_reps;

SELECT * FROM sales_reps;

/*
트랜잭션(Transaction)
    데이터 처리의 한 단위입니다.
    오라클에서 발생하는 여러 개의 SQL 명령문을
    하나의 논리적인 작업 단위로 처리하는데 이를 
    트랜잭션이라고 합니다.
    
    COMMIT : SQL문의 결과를 영구적으로 DB에 반영
    ROLLBACK : SQL문의 실행결과를 실행취소
    SQVEPOINT : 트랜잭션의 한지점에 표시하는 임시 저장점
*/
CREATE TABLE member (
    num NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    addr VARCHAR2(50)
)
;

INSERT INTO member VALUES(1, '피카츄', '태초마을');
COMMIT;
INSERT INTO member VALUES(2, '라이츄', '태초마을');
INSERT INTO member VALUES(3, '파이리', '태초마을');
INSERT INTO member VALUES(4, '꼬부기', '태초마을');
INSERT INTO member VALUES(5, '버터플', '태초마을');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6, '야도란', '태초마을');
INSERT INTO member VALUES(7, '피존투', '태초마을');
INSERT INTO member VALUES(8, '또가스', '태초마을');
ROLLBACK TO mypoint;

commit;


SELECT * FROM member;

























































