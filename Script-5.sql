 -- ================= < GROUP BY >=============
 
 -- 종별로 동물들이 몇마리씩 있는지 조회하고 싶다.
 SELECT
        ANIMAL_NAME
        SPECIES_ID
    FROM 
        ANIMAL;
 
 SELECT * FROM SPECIES;
 
 SELECT
       COUNT(*)
   FROM 
       ANIMAL 
 WHERE
       SPECIES = 'S1';
 -- S01 == 3마리
 -- S02 == 3마리
 -- S03 == 3마리
 
 SELECT 
        SPECIES_ID 
      , COUNT(*)
   FROM  
        ANIMAL      
  GROUP 
     BY
        SPECIES_ID;  
 
 -- 성별 동물 수
 SELECT 
       GENDER
     , COUNT(*)
  FROM
       ANIMAL
 GROUP
    BY 
       GENDER;
 
 -- 종별 최대 체중, 최소 체중
SELECT 
      SPECIES_ID
    , MAX(WEIGHT_KG)
    , MIN(WEIGHT_KG)
 FROM
 	  ANIMAL
 GROUP
    BY
      SPECIES_ID;
 
 -- 구역별(ZONE_ID) 동물 수, 평균체중 조회
 SELECT
        ZONE_ID
      , COUNT(*)
      , AVG(WEIGHT_KG)
   FROM        
        ANIMAL   
  GROUP      
     BY 
        ZONE_ID;
 
 SELECT
       ZONE_ID
       GENDER
       COUNT(*)
  FROM     
       ANIMAL 
  GROUP
     BY 
       ZONE_ID;
       GENDER
  ORDER 
     BY
       ZONE_ID
       GENDER DESC;
-------------------------------------------------------

 /*
  * HAVING 절
  * 그룹에 대한 조건을 제시할 때 사용하는 문법
  * WHERE절은 그룹함수를 사용할 수 없음 -> HAVING
  */
 
 -- 종별 동물 수가 4마리 이상인 종만 조회
 SELECT 
        SPECIES_ID
      , COUNT(*)
   FROM 
        ANIMAL 
  --WHERE
        --COUNT(*) >= 4
      --GENDER = 'M'
  GROUP
    BY
       SPECIES_ID
 HAVING
	   COUNT(*) >= 4;
 ORDER
    BY
       SPECIES_ID;
 SELECT
        ZONE_ID
      , AVG(WEIGHT_KG) "평균체중"
   FROM
        ANIMAL 
  GROUP       
    BY  ZONE_ID
 
 HAVING 
       AVG(WEIGHT_KG) >= 100
 ORDER
    BY
       ZONE_ID;
        
 
 