/*
      < SELECT >
      데이터를 조회하거나 검색할 때 사용하는 명령어
      
     SELECT
            조회하고자 하는 컬럼
            조회하고자 하는 컬럼
          ,
       FROM   
            테이블명;
     - ResultSet : SELECT문을 통해 조회된 데이터 결과물
                   조회된 행들의 집합     
*/

-- ANIMAL 테이블에서 모든 컬럼을 전부 다 조회 new String("abc")
SELECT * FROM ANIMAL; -- 성능에 영향을 끼치므로 사용하지 말 것

-- 필요한 컬럼만 명시해서 조회
SELECT 
       ANIMAL_NAME
     , WEIGHT_KG
 FROM  
       ANIMAL;
SELECT animal_name, weight_kg FROM animal;

-- 실습문제
1. -- SPECIES 테이블에서 SPECIES_ID와 SPECIES_NAME의 컬럼을 조회
1. SELECT
         SPECIES_ID
       , SPECIES_NAME
    FROM       
         SPECIES;

2. SELECT
		 ZONE_ID
	   , ZONE_NAME
	FROM 	 
		 ZONE;

3. SELECT 
         KEEPER_NAME
       , HIRE_DATE
    FROM     
         KEEPER;

4. SELECT 
         ANIMAL_NAME
       , GENDER
    FROM 
    	 ANIMAL;

5. SELECT
         BIRTH_DATE
       , ANIMAL_NAME
       , ZONE_ID
    FROM
         ANIMAL;

-------------------------------------------------
/*
 * < 컬럼에서 조회된 값을 가지고 산술연산 >
 * SELECT절에 산술연산을 기술해서 결과를 조회할 수 있다!
 */

-- ANIMAL 테이블로부터 동물이름, 체중을 조회
SELECT
       ANIMAL_NAME
     , WEIGHT_KG
     -- GRAM단위로 추가로 조회하고 싶은데??
     , WEIGHT_KG * 1000
  FROM     
       ANIMAL;
-- 풋볼플레이어, 몸값 13000000000억, 130억

SELECT
	   ANIMAL_NAME
	 , ARRIVAL_DATE 
	 , SYSDATE - ARRIVAL_DATE 
  FROM 
       ANIMAL; 
--> 산술연산 과정에서 NULL갑싱 존재할 경우 산술연산 결과도 NULL
---------------------------------------------------
/*
 * < 컬럼명에 별칭 달기>
 * 
 * 컬럼명 AS 별칭, 컬럼명 AS "별칭", 컬럼명 "별칭, 컬럼명 별칭
 */

SELECT 
	   ANIMAL_NAME AS 동물이름
	 , WEIGHT_KG "체중 (kg)"
	 , WEIGHT_KG * 1000 "체중(g)"
  FROM 	   
       ANIMAL;
 -- 별칭에 특수문자 또는 공백이 포함될 경우 반드시 " "로 묶어주어야함
----------------------------------------------------
/*
 *  < 리터럴 >
 */
SELECT
        ANIMAL_NAME
      , WEIGHT_KG || 'kg' 단위
   FROM 
        ANIMAL;

-----------------------------------------------------
/*
 * < DISTINCT>
 * 조회하려고하는 칼럼 앞에 작성해서 중복된값을 한 번만 조회
 * 
 * SELECT에 DISTINCT구문은 한 개 사용하는 것을 권장
 */
SELECT
       DISTINCT SPECIES_ID
   FROM
       ANIMAL;

-----------------------------------------------------
/*
 * < WHERE 절>
 * 
 * SELECT절에서 조회를 할 때 조건을 제시하는 문법
 * 조건에 만족하는 행만 조회할 수 있음
 * 
 * SELECT
 *        컬럼명
 *   FROM 
 *        테이블명
 *  WHERE
 *        조건식;
 * 
 * < 비교연산자 >
 * 동등비교 : =, !=
 * 대소비교 : <, >, <=, >=
 */
 
-- ANIMAL테이블에서 100KG이사인 동물들의 이름 조회
SELECT
       ANIMAL_NAME
  FROM
       ANIMAL
 WHERE
       WEIGHT_KG >= 100;

-- ANIMAL테이블에서 성별이 'F'인 동물들의 이름, 성별 조회

SELECT 
       ANIMAL_NAME
      ,GENDER
   FROM    
       ANIMAL 
        
WHERE 
       GENDER = 'F';

-- ANIMAL테이블 구역코드 'Z1'이 아닌 동물들의 이름, 구역코드 조회
SELECT 
       ANIMAL_NAME
     , ZONE_ID 
  FROM    
       ANIMAL 
 WHERE 
       --ZONE_ID != 'Z1';
	   ZONE_ID <> 'Z1';

-- 실행순서
-- 1.SELECT, 2. FROM, 3. WHERE
-- FROM -> WHERE -> 

-- 1. ANIMAL테이블에서 체중이 50kg 이상인 동물들의 이름, 체중 조회
SELECT
      ANIMAL_NAME
     ,WEIGHT_KG
 FROM   
      ANIMAL 
WHERE
     WEIGHT_KG >= 50;

-- 2. ANIMAL테이블에서 구역코드가 'Z2'인 동물들의 이름, 체중 조회
 SELECT 
       ANIMAL_NAME
      ,WEIGHT_KG
  FROM 
       ANIMAL 
 WHERE     
       ZONE_ID = 'Z2';

-- 3. ANIMAL테이블에서 수컷(GENDER = 'M')인 동물들의 이름, 성별, 체중 조회
SELECT
       ANIMAL_NAME
      ,GENDER
      ,WEIGHT_KG
   FROM
       ANIMAL 
 WHERE
       GENDER = 'M'
       
------------------------------------------------------------------
/*
 * < 논리 연산자 >
 * AND(이면서, 그리고) / OR(이거나, 또는)
 */
 -- 구역코드가 'Z2'이면서 체중이 50kg이상인 동물들의 이름, 구역코드, 체중 조회
 SELECT
         ANIMAL_NAME
       , ZONE_ID
       , WEIGHT_KG 
    FROM
         ANIMAL 
   WHERE
         ZONE_ID = 'Z2'
     AND
         WEIGHT_KG >= 50;

-- 구역코드가 'Z4'이거나 체중이 10KG 이하인 동물들의 이름, 구역코드, 체중 조회
SELECT
      , ANIMAL_NAME
      , ZONE_ID
      , WEIGHT_KG
   FROM 
        ANIMAL
WHERE     
       ZONE_ID = 'Z4'
   AND    
       
      
--- 체중이 100kg 이상이고 500kg 이하인 동물들의 이름, 체중 조회
SELECT
       ANIMAL_NAME
      ,WEIGHT_KG
   FROM
       ANIMAL 
  WHERE
       WEIGHT_KG >= 100
   AND
       WEIGHT_KG <= 500;


---------------------------------------------------------------
/*
 *  < BETWEEN AND>
 *  몇 이상 몇 이하인 범위에 대해 조건을 제시할 때 사용
 */
       
-- 체중이 100kg이상 500kg이하인 동물들의 이름, 체중
SELECT 
       ANIMAL_NAME
      ,WEIGHT_KG
   FROM 
        ANIMAL
  WHERE
        WEIGHT_KG BETWEEN 100 AND 500;

-- 체중이 100kg미만이거나 500kg초과하는 동물
SELECT 
        ANIMAL_NAME
      , WEIGHT_KG
   FROM 
        ANIMAL 
  WHERE
        WEIGHT_KG NOT BETWEEN 100 AND 500;



SELECT
       ANIMAL_NAME
     , ARRIVAL_DATE
  FROM
       ANIMAL 
 WHERE 
       ARRIVAL_DATE BETWEEN '18/01/01' AND '22/12/31' 