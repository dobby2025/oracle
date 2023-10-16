/*
파일명: ex05-function.sql

함수(Function)
    매개변수(인자, 파라미터)를 받아 특정 계산(작업)을 수행하고 
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

-- 문자 조작 함수
-- CONCAT() 함수 - 두 개의 파라미터 값을 연결합니다.
SELECT 'Hello ' || 'World' FROM dual;
SELECT CONCAT('Hello ', 'World') FROM dual;

-- SUBSTR() - 지정된 길이의 문자열 추출합니다.
SELECT SUBSTR('HelloWorld', 1, 5) FROM dual;

-- LENGTH() - 문자열의 길이를 숫자 값으로 표시합니다.
SELECT LENGTH('HelloWorld') FROM dual;

-- INSTR() - 문자열에서 지정된 문자의 위치를 찾습니다.
SELECT INSTR('HelloWorld', 'W') FROM dual;

-- LPAD() - 왼쪽부터 문자식으로 채운 표현식을 반환합니다.
SELECT LPAD('salary', 10, '*') FROM dual;

-- RPAD() - 오른쪽부터 문자식으로 채운 표현식을 반환합니다.
SELECT RPAD('salary', 10, '*') FROM dual;

-- REPLACE() - 문자열에서 지정된 문자를 치환합니다.
SELECT REPLACE('JACK and JUE', 'J', 'BL') FROM dual;

-- TRIM() - 문자열에서 선행 또는 후행 문자를 자릅니다.
SELECT TRIM('H' FROM 'HelloWorld') FROM dual;

SELECT TRIM(' ' FROM ' HelloWorld ') FROM dual;

-- 숫자 함수
-- ROUND() - 지정된 소수점 자릿수로 값을 반올림합니다.
SELECT ROUND(45.926, 2) FROM dual;

-- TRUNC() - 지정된 소수점 자릿수로 값을 전달합니다.
SELECT TRUNC(45.926, 2) FROM dual;

-- MOD() - 나눈 나머지를 반환합니다.
SELECT MOD(1600, 300) FROM dual;

-- CEIL() - 주어진 숫자를 올림하여 정수로 반환합니다.
SELECT CEIL(45.2) FROM dual;

/*
날짜 연산
    날짜에 숫자를 더하거나 빼서 결과 날짜 값을 구합니다.
    두 날짜 사이의 일수를 알아내기 위해 빼기연산을 합니다.
*/
SELECT sysdate FROM dual;

SELECT last_name, (sysdate - hire_date) / 7 AS WEEKS
FROM employees
WHERE department_id = 90;

/*
날짜 조작 함수
    MONTHS_BETWEEN(date1, date2) : 두 날짜 간의 월 수를 계산합니다.
    ADD_MONTHS(date, n) : 날짜에 n개월을 추가 합니다.
    NEXT_DAY(date, day_of_week) : 
        지정된 날짜의 다음으로 주어진 요일이 나오는 날짜를 계산합니다.
        (1:일요일 ~ 7:토요일)
    LAST_DAY(date) : 주어진 월의 마지막 날짜를 반환합니다.
    ROUND(date, format) : 날짜를 지정된 형식으로 반올림합니다.
    TRUNC(date, format) : 날짜를 지정된 형식으로 절삭합니다.
*/
SELECT MONTHS_BETWEEN(TO_DATE('2017-12-22', 'YYYY-MM-DD'),
                        TO_DATE('2017-05-22', 'YYYY-MM-DD'))
FROM dual;
SELECT ADD_MONTHS(TO_DATE('2022-12-16', 'YYYY-MM-DD'), 8) 
FROM dual;
SELECT NEXT_DAY(TO_DATE('2023-10-16', 'YYYY-MM-DD'), 7)
FROM dual;
SELECT LAST_DAY(SYSDATE) FROM dual;
SELECT ROUND(TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'MONTH') 
FROM dual;
SELECT TRUNC(TO_DATE('2023-08-31', 'YYYY-MM-DD'), 'MONTH') 
FROM dual;

/*
TO_CHAR() 함수 - 날짜 또는 숫자를 문자열로 변환
    
    YYYY - 전체 연도를 숫자로 나타냅니다.
    YEAR - 영어 철자로 표기된 연도를 반환합니다.
    MM - 월 2자리 숫자 값을 반환합니다.
    MONTH - 전체 월 이름을 반환합니다.
    MON - 월의 3자리 약어를 반환합니다.
    DY - 3자리 요일 약어를 반환합니다.
    DAY - 요일의 전체 이름을 반환합니다.
    HH, HH12, HH24 - 1일 동안 시간 또는 반일 시간(1-12) 또는 전일시간(0-23)
                반환합니다.
    MI - 분(0-59)을 반환합니다.
    SS - 초(0-59)를 반환합니다.
    FF - 밀리세컨드(0-999)를 반환합니다.
    AM 또는 PM - 오전/오후를 나타내는 자오선 표시 반환합니다.
    A.M 또는 P.M - 오전/오후를 나타내는 마침표가 있는 자오선 표시를 반환합니다.


*/










































































