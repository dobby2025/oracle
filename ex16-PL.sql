/*
파일명: ex16-PL.sql

PL/SQL (Procedual Language extension to SQL)
    SQL을 확장한 절차적 언어 입니다.
    여러 SQL을 하나의 블록(block)으로 구성하여 SQL제어할 수 있습니다.
    
프로시저(Procedure)
    데이터베이스에서 실행가능한 하나이상의 SQL문을 묶어서 하나의
    논리적 작업단위로 만든 데이터베이스 객체입니다.
*/

/*
익명 프로시저 -- 일회용 프로시저 DB에 저장되지 않습니다.
[기본구조]
    DECLARE     -- 변수정의
    BEGIN       -- 처리 로직 시작
    EXCEPTION   -- 예외처리
    END         -- 처리 로직 종료
*/

-- 실행결과를 출력하도록 설정
SET SERVEROUTPUT ON;

-- 스크립트 경과 시간을 출력하도록 설정
SET TIMING ON;




DECLARE     -- 변수 정의
    V_STRD_DT       VARCHAR2(8);
    V_STRD_DEPTNO   NUMBER;
    V_DEPTNO        NUMBER;
    V_DNAME         VARCHAR2(50);
    V_LOC           VARCHAR2(50);
    V_RESULT_MSG    VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN       -- 로직 시작
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    V_STRD_DEPTNO := 10;
    
    SELECT T1.department_id
         , T1.department_name
         , T1.location_id
      INTO V_DEPTNO
         , V_DNAME
         , V_LOC
    FROM departments T1
    WHERE T1.department_id = V_STRD_DEPTNO;
    -- 조회 결과 변수 설정
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    -- 조회 결과 출력
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
EXCEPTION 
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    WHEN OTHERS THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END;
/
-- 작업종료
 
    
    
    








