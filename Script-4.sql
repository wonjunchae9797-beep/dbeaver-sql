/* 
	< 함수 FUNCTION >
    자바로 따지면 자바 API메소드들같은 개념
    함수 호출시 전달된 값을 받아서 계산된 결과를 반환
    
    - 단일행함수(이런게 있구나~~) : N개의 값을 읽어서 N개의 결과를 반환
    (매 행마다 함수 실행)
    - 그룹함수(외우세요!) : N개의 값을 읽어서 1개의 결과를 반환
    (하나의 그룹별로 함수 실행)
    
    단일행함수/ 그룹함수는 일반적으로 함꼐 사용하지 않음
    = Resultste의 행 수가 다르기 때문에
*/

 -- =================================================
 -- ================= 단일행함수(문자관련) ================

/*
 * LENGTH(컬럼|문자열) : 해당 문자열의 글자 수 반환
 * LENGTHB(컬럼|문자열) : 해당 문자열의 바이트 수 반환
 * - 한글 : 3Byte(UTF-8), 영문/숫자/특수문자 1Byte
 */
SELECT 
        ANIMAL_NAME
      , LENGTH(ANIMAL_NAME)
   FROM 
        ANIMAL
  WHERE       
        LENGTH(ANIMAL_NAME) = 2;

/*
 * INSTR(문자열, 특정문자, 찾을위치시작값, 순번)
 * 지정한 위치부터 특정 문자열을 검색해서 가장 먼저 찾은 위치 반환
 */
                                      --DUAL(Dummy테이블) 
SELECT INSTR('AABAACAABBAA' , 'B') FROM DUAL; -- 3      
SELECT INSTR('AABAACAABBAA' , 'B', 1) FROM DUAL; -- 3      
SELECT INSTR('AABAACAABBAA' , 'B', -1) FROM DUAL; -- 10(뒤에서 부터 첫번째인걸 찾는다)      
SELECT INSTR('AABAACAABBAA' , 'B', -1, 2) FROM DUAL; -- 9(앞에는 시작점, 뒤에는 순서)

/*
 * SUBSTR(문자열, 시작위치, 추출할문자수)
 * 문자열에서 특정 문자열을 추출해서 변환
 */
SELECT * FROM KEEPER;
SELECT 
        KEEPER_NAME
      , SUBSTR(KEEPER_NAME, 1,1 ) AS "이름 첫 글자"
   FROM     
        KEEPER;

/*
 * LPAD / RPAD(문자열, 최종길이, 덧붙일문자)
 * 문자열에 덧붙일 문자를 왼쪽/오른쪽에 붙여서 최종길이만큼 반환
 */
SELECT 
        ANIMAL_NAME
      , LPAD(ANIMAL_NAME, 10, '*')
      , RPAD(ANIMAL_NAME, 10, '*')
   FROM 
        ANIMAL;
SELECT
        KEEPER_NAME
      , RPAD(SUBSTR(KEEPER_NAME, 1, 1), LENGTH(KEEPER_NAME) + 1 , '*')
   FROM
        KEEPER;

------------------------------------------------------------------
/*
 * TRIM(문자열) : 양쪽 공백문자 제거
 * LTRIM(문자열, 제거할문자)
 * RTIRM(문자열,제거할문자)
*/

SELECT TRIM('    동물원      ') FROM DUAL;

/*
 * LOWER / UPPER / INITCAP
 */
 SELECT 
        LOWER('Hello World')
      , UPPER('HELLOW WORLD')
      , INITCAP('HELLOW WORLD')      
   FROM
        DUAL;

/*
 * REPLACE(문자열, 찾을문자, 바꿀문자)
 */

SELECT 
       CONCAT(ANIMAL_NAME, '은(는) 귀엽다')
      , ANIMAL_NAME || '은(는) 귀엽다' || '.' || '!!'
  FROM  
       ANIMAL;
-----------------------------------------------------------
-- < 숫자 관련 함수>
/*
 * ABS(숫자) : 절대값
 * MOD(숫자1, 숫자2) : 나머지 
 * TRUNC(숫자, 소숫점위치) : 버림(절삭)
 */
SELECT 
        ANIMAL_NAME
      , WEIGHT_KG
      , ROUND(WEIGHT_KG, 0) AS "반올림"
      , CEIL(WEIGHT_KG) AS "올림"
      , FLOOR(WEIGHT_KG) AS "내림"
   FROM 
        ANIMAL; 
---------------------------------------------------------------
-- <날짜 관련 함수>

/*
 * SYSDATE : 현재 시스템 날짜
 * MONTHS_BETWEEN(날짜1, 날짜2) 두 날짜 사이의 개월 수
 * EXTRACT(YEAR|MONTH|DAY FROM 날짜) : 날짜에서 년/원/일 추출
 */
 
-- 각 동물의 나이 조회
SELECT 
        ANIMAL_NAME
      , ARRIVAL_DATE
      , FLOOR(MONTHS_BETWEEN(SYSDATE, ARRIVAL_DATE)) AS "개월 수"
      , FLOOR(MONTHS_BETWEEN(SYSDATE, ARRIVAL_DATE) / 12 ) AS "나이(년)"
      , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM ARRIVAL_DATE) "햇수계산"
   FROM  
        ANIMAL; 
--------------------------------------------------------------------
------------< 형변환 함수 >

/*
 * TO_CHAR(날짜|숫자, 포매팅형식) : 문자타입으로 변환
 * TO_DATE(문자, 포매팅형식) : 날짜 타입으로 변환
 * TO_NUMBER(문자) : 숫자타입으로 변환
 */
SELECT
        KEEPER_NAME 
      , TO_CHAR(HIRE_DATE, 'YYYY"년"-MM"월"-DD"일") "입사일"
   FROM 
        KEEPER;

SELECT
       TO_CHAR(123456789, '99,99,99,99')
  FROM
       DUAL; 
-----------------------------------------------------

/*
--NVL
--NVL2



SELECT 
        ANIMAL_NAME
      , NVL(TO_CHAR(ANIMAL_DATE, 'YYYY-MM-DD') '동물원에서 태어남')
   FROM
        ANIMAL;
          
   
      
      
      
      
      
      
      
      
      