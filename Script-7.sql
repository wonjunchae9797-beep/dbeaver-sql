/*
 * < DQL(DATA QUERY Language) > => SELECT
 * 
 *  <DML(DATA Manipulation Language)>
 * 데이터 조작 언어
 * 테이블에 테이터를 삽입(INSERT), 수정(UPDATE), 삭제(DELETE)하는 구문
 * 
 * 주으) DML수행 후 반드시 TCL(COMMIT/ROLLBAKC) 처리 필요
 */
-- ==================< INSERT > ========================
/*
 * 테이블에 새로운 행을 추가하는 구문
 * 
 * [ 표현법 1 ] 모든 컬럼에 값을 넣는 경우
 * INSERT INTO 테이블명 VALUES(값, 값, 값, ...);
 * 
 * [ 표현법 2] 특정 컬럼만 값을 지정하는 경우
 * INSERT INTO 테이블명(컬럼명, 컬럼명, ...)
 */

SELECT * FROM KEEPER;


INSERT
  INTO  
      KEEPER
      (
      KEPPER_ID
     ,KEPPER_NAME
     ,HIRE_DATE
     ) 
VALUES
      (
        'K09'
       ,'이승철'
       ,SYSDATE
      );

-- ANIMAL 테이블에 새로운 동물을 한 마리 추가해보세요

SELECT * FROM ANIMAL;

INSERT 

 INSERT
   INFO
       ANIMAL
   VALUES
        (
         'A27'
        ,'캥거루'
        ,'S13'
        ,'Z5'
        ,'K07'
        , 'F'
         '500'
          TO_DATE('1941-01-01', 'YYYY-MM-DD')
          TO-DATE('1963-12-02', 'YYYY-MM-DD')
          );
 
 SELECT * FROM ANIMAL;
 SELECT * FROM SPECIES;
 
 SELECT * FROM ZONE;
 INSERT ALL
  INTO ZONE VALUES('Z7', '북극관', '실내')
  INTO ZONE VALUES('Z8', '아마존관', '실외')
SELECT * FROM DUAL;

CREATE TABLE ANIMAL_BACKUP
AS SELECT * FROM ANIMAL WHERE 1 = 0; -- 구조만 복사

SELECT * FROM ANIMAL WHERE 1 = 0;
SELECT * FROM ANIMAL_BACKUP;

INSERT INTO ANIMAL_BACKUP
(SELECT * FROM ANIMAL WHERE ZONE_ID = 'Z1');

-- ========================= < UPDATE > ========================
/*
 * 기존 데이터를 수정하는 구문
 * 
 * [ 표현법 ]
 * UPDATE
 *       테이블명
 *    SET
 *       컬럼명 = 바꿀값
 *      ,컬럼명 = 바꿀값 
 *      ,....
 * WHERE
 *       조건식;
 *
 */
 
SELECT * FROM ANIMAL ORDER BY ANIMAL_ID DESC;
--WHERE절을 생략하면 모든 행이 수정됨!
ROLLBACK;
UPDATE
       ANIMAL 
   SET
       KEEPER_ID = 'K02'
  WHERE
       (SPECIES_ID, ZONE_ID)ANIMAL_ID = 'A35';
-- 서브쿼리를 활용한 UPDATE
-- 러바오와 같은 구역에 있는 판다들의 사육사를 K02로 통일
SELECT * FROM KEEPER;

SELECT
        SPECIES_ID
      , ZONE_ID
   FROM 
        ANIMAL 
  WHERE 
        ANIMAL_ID = (SELECT
                           ANIMAL_ID
                     FROM
                          ANIMAL 
                     WHERE     
                           
                           )

        
   
       

         
      
       
       
