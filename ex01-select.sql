/*
파일명: ex01-select.sql

SQL (Structured Query Language)
    관계형 데이터 베이스 시스템에서 자료 관리 및 처리하기 위해 설계된 언어

SELECT 문
    데이터베이스에서 정보 검색 명령어
*/

-- 모든 열 선택 *
SELECT * 
FROM departments;

-- 특정 열 선택 (프로젝션 Projection)
SELECT department_id, location_id
FROM departments;

/* 
산술식
    산술연산자를 사용하여 숫자/날짜 데이터 표현식 작성

    + 더하기
    - 빼기
    * 곱하기
    / 나누기

*/
-- 산술연산자 사용
SELECT 
    last_name,
    salary,
    salary + 300
FROM employees;

/*
연산자 우선순위
    곱하기와 나누기는 더하기 빼기보다 먼저 수행
*/
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
산술식의 Null 값
    null 값을 포함하는 산술식은 null로 계산
*/
SELECT last_name, 12*salary*commission_pct, 
    salary, commission_pct
FROM employees;



















