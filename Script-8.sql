/*
    < DDL (Data Definition Language) >
    데이터 정의 언어
    객체(테이블, 사용자, 함수, 뷰, 시퀸스, 프로시저, 인덱스...)를 
    생성(CREATE), 변경(ALTER), 삭제(DROP) 하는 구문
    
    주의 ) DDL은 자동 COMMIT 됨 + ROLLBAKC 불가
*/
-- < CREATE TABLE >

SELECT * FROM DBA_USERS;


  /*CREATE TABLE 테이블명 (
  	 컬럼명 자료형(크기),
     컬럼명 자료형(크기),
   ...
   );
  
  < 자료형 >
  - 문자자료형 / 숫자자료형 / 날짜자료형
 * - CHAR(크기) : 고정 길이 문자 (최대 2000byte)
 * - VARCHAR2(크기) : 가변 길이 문자 (최대 4000byte) -- 한글이 포함되지 않는다
 * - NVARCHAR2(크기) : 가변 길이 문자 글자수로 체크(최대 4000byte) -- 한글이 포함된다.
 * -- CLOB, NCLOB : 대용량 텍스트를 저장해야겠다.
 * - NUMBER : 숫자(정수/실수)
 * - DATE   : 날짜 
 * -- TIMESTAMP
 */

-- 진료기록 테이블 만들기
 CREATE TABLE MEDICAL_RECORD(
	RECORD_ID CHAR(2),
	ANIMAL_NO CHAR(3),
	CHECK_DATE DATE,
	DOCTOR_NAME NVARCHAR2(21),
	TREATMENT NVARCHAR2(500) -- 테이블 만들때 입력화면과 출력화면을 먼저 생각하고 만들기
);
SELECT * FROM MEDICAL_RECORD;
INSERT INTO MEDICAL_RECORD
VALUES ('R0001', 'A01', SYSDATE, '홍길동', '영양제투어');
INSERT INTO MEDICAL_RECORD 
VALUES (NULL,NULL, SYSDATE, '고길동', '영앙제투어');
INSERT INTO MEDICAL_RECORD 
VALUES ('R0001', NULL, SYSDATE, '홍길동', '영양제투어');
INSERT INTO MEDICAL_RECORD
VALUES ('R0002', 'ABC', SYSDATE, '홍길동', '영양제투어');

------------------------------------------------------
--< 제약조건 CONSTRAINT >

/*
 * 데이터의 무결성을 보장하기 위한 조건
 * 
 * - NOT NULL : NULL값을 허용하지 않음
 * - UNIQUE : 중복값 허용하지 않음
 * - CHECK : 지정한 조건에 맞는 값만 허용
 * - PRIMARY KEY : 각 행을 식별하기 위한 식별컬럼(NOT NULL, UNIQUE)
 * - FOREIGN KEY : 다른 테이블의 컬럼값만 허용
 */

-- 컬럼의 기본값을 지정하는 구문 : DEFAULT  
DROP TABLE MEDICAL_RECORD;
SELECT * FROM MEDICAL_RECORD;
CREATE TABLE MEDICAL_RECORD(
	RECORD_ID CHAR(5) ,
	ANIMAL_ID CHAR(3) NOT NULL,
	CHECK_DATE DATE DEFAULT SYSDATE NOT NULL,
	SEVERITY CHAR(1),
    --CONSTRAINT RECORD_UNIQUE UNIQUE(RECORD_ID),
	CONSTRAINT SEV_CK CHECK (SEVERITY IN ('H', 'M', 'L')),
	PRIMARY KEY(RECORD_ID), -- 테이블마다 하나씩만 넣는게 원칙이지만 특정상황에서는 복합키를 쓸 수가 있다.
	FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMAL(ANIMAL_ID)
);
INSERT INTO MEDICAL_RECORD
VALUES ('R0001', 'A01', SYSDATE, 'M');
INSERT INTO MEDICAL_RECORD(RECORD_ID, ANIMAL_ID)
VALUES('R0002', 'A99');	
INSERT INTO MEDICAL_RECORD
VALUES ('R0003', 'A02', SYSDATE, 'U');
SELECT * FROM ANIMAL;

SELECT 
       RECORD_ID,
       ANIMAL_NAME
   FROM
       MEDICAL_RECORD
   JOIN
       ANIMAL USING(ANIMAL_ID);
       

/*
 * 좋아요 갯수 ( 누가,무엇을 중 하나라도 중복이 되지않으면 좋아요 갯수가 오름)
 * 
 * 누가            홍길동    홍길동    홍길동    고길동
 * 무엇을            1        1       2       1
 */
 CREATE TABLE LIKES(
 	누가
    무엇을
 ) 
 
 
 
 ---------------------------------------------------------
 -- < ALTER TABLE >
 
 /*
  * 구조를 변경하는 구문
  * 
  * - 컬럼추가 : ALTER TABLE 테이블명 ADD 컬럼명 자료형;
  * - 컬럼수정 : ALTER TABLE 테이블명 MODIFT 컬럼명 자료형;
  * - 컬럼삭제 : ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
  * - 컬렴명변경 : ALTER TABLE 테이블명 RENAME COLUMN 원래이름 TO 새이름;
  */
SELECT * FROM MEDICAL_RECORD; 
 ALTER TABLE MEDICAL_RECORD ADD COST NUMBER;
 ALTER TABLE MEDICAL_RECORD MODIFY RECORD_ID CHAR(5);
 ALTER TABLE MEDICAL_RECORD RENAME COLUNM CHECK_DATE TO CK_DATE;
 ALTER TABLE MEDICAL_RECORD DROP COLUMN COST
 
 -- 제약조건 삭제
 ALTER TABLE MEDICAL_RECORD DROP CONSTRAINT SEV_CK;
 
 -- 제약조건 추가 
 ALTER TABLE MEDICAL_RECORD 
 ADD CONSTRAINT SEV_CK CHECK(SEVERITY IN ('H', 'M'));
 
 --------------------------------------------------------
 -- < DROP TABLE >
 DROP TABLE MEDICAL_RECORD ;


  



















