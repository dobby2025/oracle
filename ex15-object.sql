/*
파일명: ex15-object.sql

데이터베이스 객체
    테이블 : 기본 저장단위이며 행으로 구성되어 있습니다.
    뷰 : 하나 이상의 테이블에 있는 데이터의 부분 집합을 논리적으로 나타냅니다.
    시퀀스 : 일련의 숫자를 자동으로 생성해주는 객체입니다.
    인덱스 : 테이블의 데이터에 대한 빠른검색을 지원해주는 색인 객체입니다.
    동의어 : 객체에 다른 이름을 부여합니다.
*/

-- 뷰 생성
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;

DESC empvu80;

SELECT * FROM empvu80;

-- alias 사용 뷰 생성
CREATE VIEW salvu50
AS SELECT employee_id ID_NUMBER, last_name name, salary*12 ANN_SALARY
    FROM employees
    WHERE department_id = 50;
    
SELECT * FROM salvu50
WHERE ANN_SALARY >= 50000
;


CREATE VIEW salvu_hangle
AS SELECT employee_id 아이디, last_name 이름, salary*12 연봉
    FROM employees
    WHERE department_id = 50;

SELECT 아이디, 이름, 연봉 FROM salvu_hangle;


-- 뷰 수정
CREATE OR REPLACE VIEW empvu80
    (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' || last_name,
            salary, department_id
    FROM employees
    WHERE department_id = 80;
    
SELECT * FROM empvu80;

UPDATE empvu80 SET
department_id = 90
WHERE id_number = 145;

ROLLBACK;

SELECT * FROM employees
WHERE employee_id = 145;


/*
복합 뷰 생성
    두 개 이상 기본 테이블에 의해 정의된 뷰
*/
CREATE OR REPLACE VIEW dept_sum_vu
    (name, minsal, massal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
        MAX(e.salary), AVG(e.salary)
    FROM employees e JOIN departments d
    ON e.department_id = d.department_id
    GROUP BY d.department_name;

SELECT * FROM dept_sum_vu;
/*
뷰 DML 작업 수행 규칙
    1. 행 제거할 수 없는 경우
        - 그룹 함수
        - GROUP BY 절
        - DISTINCT 키워드
        - Pseudocolumn ROWNUM 키워드
    2. 뷰의 데이터를 수정할 수 없는 경우
        - 그룹 함수
        - GROUP BY 절
        - DISTINCT 키워드
        - Pseudocolumn ROWNUM 키워드
        - 표현식으로 정의되는 열
    3. 뷰를 통해 데이터를 추가할 수 없는 경우
        - 그룹 함수
        - GROUP BY 절
        - DISTINCT 키워드
        - Pseudocolumn ROWNUM 키워드
        - 표현식으로 정의되는열
        - 뷰에서 선택되지 않은 기본 테이블의 NOT NULL 열
*/

-- ROWNUM : 쿼리의 결과의 각 행에 순차적인 번호를 할당해 준다.
SELECT ROWNUM, employee_id, last_name
FROM employees
WHERE department_id = 80;

-- DML 작업 거부
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT employee_id, last_name, job_id
    FROM employees
    WHERE department_id = 10
    WITH READ ONLY;
    
SELECT * FROM empvu10;
    
UPDATE empvu10 SET
employee_name = 'Whalen1'
WHERE employee_number = 200;

/*
WITH CHECK OPTION
    뷰에 대한 데이터 변경작업 제한
*/
CREATE OR REPLACE VIEW high_salary_employee_vu
AS SELECT * FROM employees WHERE salary > 10000
WITH CHECK OPTION CONSTRAINT high_salary_employee_ck;

SELECT * FROM high_salary_employee_vu;

-- 뷰의 WITH CHECK OPTION의 조건에 위배됩니다.
UPDATE high_salary_employee_vu SET
salary = 2400
WHERE employee_id = 100;








    
    
















