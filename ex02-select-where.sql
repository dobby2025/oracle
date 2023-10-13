/*
파일명 : ex02-select-where.sql

WHERE 
    조건을 충족하는 행으로 query를 제한합니다.
*/

-- WHERE 절 사용
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

/* 
문자열 및 날짜
  문자열 및 날짜 값은 작은 따옴표로 묶습니다.
  문자 값은 대소문자를 구분하고 날짜 값은 형식을 구분합니다.  

  기본 날짜 표현형식은 DD-MON-RR
*/
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

SELECT last_name, hire_date
FROM employees
WHERE hire_date = '03/06/17';

/*
비교 연산자
    특정 표현식을 다른값이나 표현식과 비교하는 조건에서 사용됩니다.
    
    =   같음
    >   보다 큼
    >=  보다 크거나 같음
    <   보다 작음
    <=  보다 작거나 같음
    <>  같지 않음
    BETWEEN ... AND ...     두 값 사이(경계값 포함)
    IN(set)                 값 리스트 중 일치하는 값 검색
    LIKE                    일치하는 문자 패턴 검색
    IS NULL                 NULL 값인지 여부
*/

-- 비교 연산자 사용
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

-- BETWEEN 연산자를 사용하는 범위 조건
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

SELECT last_name, salary
FROM employees
WHERE salary >= 2500
AND salary <= 3500
;

-- IN 연산자를 사용하는 멤버조건
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id = 100
OR manager_id = 101
OR manager_id = 201
;

/*
LIKE 연산자를 사용하여 패턴 일치
    LIKE 연산자를 사용하여 유효한 검색 문자열 값의 
    대체 문자 검색을 수행합니다.
    검색 조건에는 리터럴 문자나 숫자가 포함될 수 있습니다.
        % : 0개 이상의 문자를 나타냅니다.
        _ : 한 문자를 나타냅니다.
*/
SELECT first_name
FROM employees
WHERE first_name LIKE '%A%';
































