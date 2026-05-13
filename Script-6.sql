/*
 *  < JOIN >
 * 두 개 이상의 테이블을 연결하여 하나의 결과로 조회하는 것
 * 연결고리가 되는 컬럼을 통해 관계를 맺어줌
 * 
 * - 오라클전용문법 / ANSI(표준)문법이 있음
 */
 
-- 동물의 이름, 종 이름 조회
-- ANIMAL -> ANIMAL_NAME
-- SPECIES -> SPECIES_NAME

SELECT ANIMAL_NAME,SPECIES_ID FROM ANIMAL;
SELECT SPECIES_NAME, SPECIES_ID FROM SPECIES;

--> 오라클 전용 구문
SELECT
        ANIMAL_NAME
    --  , A.SPECIES_ID
    --  , S.SPECIES_ID
      , SPECIES_NAME
   FROM
        ANIMAL A
      , SPECIES S
  WHERE 
        A.SPECIES_ID = S.SPECIES_ID; 

--> ANSI구문
SELECT
       ANIMAL_NAME
     , SPECIES_NAME
  FROM
       ANIMAL 
  JOIN 
       SPECIES USING(SPECIES_ID)
 -- EQUAL JOIN(등가조인) / INNER JOIN(내부조인)
 -- 연결되는 칼럼의 값이 일치하는 행들만 조인해서 조회(일치하지않는 행은 결과에서 제회)  
 
 -- CARTESIAN PRODUCT(카데시안곱) => 테이블끼리의 모든 행을 곱한 결과
 -- 지구상에서 일어선 안됨!!  
 
SELECT * FROM ZONE;    -- ZONE_ID, ZONE_NAME
SELECT * FROM ANIMAL;  -- ZONE_ID, ANIMAL_NAME
-- 동물 이름, 구역명 조회

-- ANSI -> 연결고리 컬럼명이 다르다고 가정
  SELECT
         ANIMAL_NAME 
       , ZONE_NAME
	FROM
	     ANIMAL A
	JOIN
	     ZONE Z ON(A.ZONE_ID = Z.ZONE_ID);

-- 동물이름, 종 이름, 구역명 조회
-- SPECIES_ID -> ANIMAL, SPECIES
-- ZONEID -> ANIMAL, ZONE

SELECT
       ANIMAL_NAME 
     , SPECIES_NAME
     , ZONE_NAME
  FROM
       ANIMAL
  JOIN 
       SPECIES USING(SPECIES_ID)
  JOIN 
       ANIMAL USING(ZONE_ID);
 
SELECT ANIMAL_NAME, SPECIES_NAME
  FROM ANIMAL NATURAL JOIN SPECIES;

-- 동물이름, 종 이름, 구역명, 담당 사육사 이름(KEEPER)
-- ANIMAL        SPECIES        ZONE     KEEPER
-- SPECIES_ID  SPEICES_ID
--                                ZONE_ID     
--                                         KEEPER_ID
 SELECT * FROM ANIMAL;   
 
SELECT   
         ANIMAL_NAME
       , SPECIES_NAME
       , ZONE_NAME
       , KEEPER_NAME
    FROM 
         ANIMAL 
    JOIN 
         SPECIES USING(SPECIES_ID)
    JOIN  
         ZONE USING (ZONE_ID)
    JOIN 
         KEEPER USING(KEEPER_ID);
--ANIMAL 테이블에서 KEEPER_ID컬럼의 값이 NULL인 경우 조회 안됨
--INNER JOIN이므로 

--------------------------< 외부 조인(OUTER JOIN) >----------------
/*
 * 조인 조건에 만족하지 않는 행도 포함시켜 조회
 * LEFT OUTER JOIN  : 왼쪽 테이블의 모든 행 조회
 * RIGHT OUTER JOIN : 오는쪽 테이블의 모든 행 조회
 * FULL OUTER JOIN  : 양쪽 테이블의 모든 행 조회
 * 
 */

-- LEFT JOIN : ANIMAL_NAME, KEEPER_NAME 조회
SELECT 
        ANIMAL_NAME
       ,ANIMAL_NAME
    FROM 
        ANIMAL LEFT JOIN KEEPER USING(KEEPER_ID);
--> 오라클 전용 구문  
SELECT 
       ANIMAL_NAME,
       KEEPER_NAME
   FROM 
       ANIMAL A
      ,KEEPER k 
 WHERE  
       A.KEEPER_ID = K.KEEPER_ID(+);

SELECT * FROM KEEPER;

-- RIGHT JOIN
SELECT 
       ANIMAL_NAME 
     , KEEPER_NAME 
  FROM  
       ANIMAL A
  RIGHT
  OUTER
   JOIN 
       KEEPER K ON (A.KEEPER_ID = K.KEEPER_ID);
-- FULL OUTER JOIN : 양쪽 모두 포함
 SELECT   
       ANIMAL_NAME
     , KEEPER_NAME
  FROM 
       ANIMAL
  FULL     
-- OUTER(생략)  
  JOIN
       KEEPER USING(KEEPER_ID);
  
-----------------------------------------
-- NON EQUAL JOIN(비등가조인)
-- (=) <-이 아닌 범위 비교
-- 예) 체중 WEIGHT_KH BETWEEN MIN_WEIGHT AND MAX_WEIGHT
-- SELF JOIN
-- 테이블이 자기 자신과 조인해서 ResultSet을 만드는 경우

SELECT * FROM KEEPER;
-----------------------------------------------------
-- 35마리의 동물 전체 정보 조회
-- 동물의 이름, 종이름, 분류, 구역명, 실내외여부, 사육사명
--                                         (사육사가 배정되지 않는 경우 미배정이라 출력)
-- 정렬은 ANIMAL_ID 오름차순으로 정렬하시오.
 SELECT 
       A.ANIMAL_ID,
       A.ANIMAL_NAME,
       A.SPECIES_ID,
       S.SPECIES_CLASS,
       Z.ZONE_NAME,
       Z.ZONE_TYPE,
       NVL (K.KEEPER_NAME, '미배정') AS 
       KEEPER_NAME
  FROM 
       ANIMAL A
  LEFT JOIN SPECIES S ON A.SPECIES_ID = S.SPECIES_ID
  LEFT JOIN ZONE Z ON A.ZONE_ID = Z.ZONE_ID 
  LEFT JOIN KEEPER k ON A.KEEPER_ID = K.KEEPER_ID 
ORDER BY A.ANIMAL_ID;      
       
       
      
      
 
       
       
       
                                         
  
  

    


    
    
       
      
     
       

          
          
          
         




  
  










