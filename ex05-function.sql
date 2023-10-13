/*
파일명: ex05-function.sql

함수(Function)
    매개변수(인자)를 받아 특정 계산(작업)을 수행하고 
    결과를 반환하는 구조로 되어 있다.

함수 유형
    단일행 함수 - 단일행 매개변수를 받아 결과 값 반환
    여러행(그룹) 함수 - 여러행 매개변수를 받아 결과 값 반환
*/
-- 단일행 함수

-- 대소문자 변환 함수
-- LOWER() 함수 - 문자열을 소문자로 반환
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- UPPER() 함수 - 문자열을 대문자로 변환.
SELECT UPPER('higgins') FROM dual;

-- INITCAP() 함수 - 문자열의 첫 글자를 대문자로 변환
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = INITCAP('higgins');

SELECT INITCAP('higgins') FROM dual;









