DROP TABLE "COMPANY";
DROP TABLE "MENU";
DROP TABLE "FILE";
DROP TABLE "REVIEW";
DROP TABLE "U_MEMBER";
DROP TABLE "BOOKING";
DROP TABLE "B_QnA";
DROP TABLE "B_MENU";
DROP TABLE "U_BOOKMARK";
DROP TABLE "ADMIN";
DROP TABLE "NOTICE";
DROP TABLE "CLAUSE";
DROP TABLE "A_QnA";
DROP TABLE "U_QnA";
DROP TABLE "C_AGREE";
DROP TABLE "B_MEMBER";

-- 시퀀스 DROP
DROP SEQUENCE A_QNA_SEQ;
DROP SEQUENCE ADMIN_SEQ;
DROP SEQUENCE B_QNA_SEQ;
DROP SEQUENCE B_MEMBER_SEQ;
DROP SEQUENCE BOOKING_SEQ;
DROP SEQUENCE C_AGREE_SEQ;
DROP SEQUENCE COMPANY_SEQ;
DROP SEQUENCE MENU_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE U_BOOKMARK_SEQ;
DROP SEQUENCE U_QNA_SEQ;

CREATE TABLE "B_MEMBER" (
	"BU_NO"	NUMBER		NOT NULL,
	"BU_ID"	VARCHAR2(20)		NOT NULL,
	"BU_NUMBER"	VARCHAR2(20)		NOT NULL,
	"BU_PWD"	VARCHAR2(40)		NOT NULL,
	"BU_NAME"	VARCHAR2(20)		NOT NULL,
	"BU_BIRTH"	VARCHAR2(20)		NOT NULL,
	"BU_GENDER"	VARCHAR2(1)		NOT NULL,
	"BU_EMAIL"	VARCHAR2(100)		NOT NULL,
	"BU_TEL"	VARCHAR2(20)		NOT NULL,
	"BU_USEYN"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"BU_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"BU_UPDATE_DATE"	TIMESTAMP		NULL,
	"BU_OUT_DATE"	TIMESTAMP		NULL,
	"FL_GNO"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "B_MEMBER"."BU_NUMBER" IS '000-00-00000';

COMMENT ON COLUMN "B_MEMBER"."BU_BIRTH" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "B_MEMBER"."BU_GENDER" IS '남자 : M / 여자 : F';

COMMENT ON COLUMN "B_MEMBER"."BU_EMAIL" IS 'id@jiwoodong.com';

COMMENT ON COLUMN "B_MEMBER"."BU_TEL" IS '010-0000-0000';

COMMENT ON COLUMN "B_MEMBER"."BU_USEYN" IS '사용 : Y / 미사용 : N';

COMMENT ON COLUMN "B_MEMBER"."BU_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "B_MEMBER"."BU_UPDATE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "B_MEMBER"."BU_OUT_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "COMPANY" (
	"CP_NO"	NUMBER		NOT NULL,
	"BU_NO"	NUMBER		NOT NULL,
	"CP_CATEGORY"	VARCHAR2(20)		NOT NULL,
	"CP_NAME"	VARCHAR2(20)		NOT NULL,
	"CP_EXPLAIN"	VARCHAR2(4000)		NULL,
	"CP_CLASSIFY"	VARCHAR2(1)		NOT NULL,
	"CP_SIGNYN"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"CP_OPEN_DATE"	VARCHAR2(40)		NULL,
	"CP_CLOSE_DATE"	VARCHAR2(40)		NULL,
	"CP_OPEN_TIME"	VARCHAR2(40)		NULL,
	"CP_CLOSE_TIME"	VARCHAR2(40)		NULL,
	"CP_TERM"	VARCHAR2(100)		NULL,
	"CP_POSTCODE"	VARCHAR2(20)		NOT NULL,
	"CP_ADDRESS"	VARCHAR2(200)		NOT NULL,
	"CP_DTADDRESS"	VARCHAR2(1000)		NOT NULL,
	"CP_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"CP_UPDATE_DATE"	TIMESTAMP		NULL,
	"FL_GNO"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "COMPANY"."CP_CATEGORY" IS '카페/미용실/호텔';

COMMENT ON COLUMN "COMPANY"."CP_CLASSIFY" IS '항상 : A / 특정기간 : B';

COMMENT ON COLUMN "COMPANY"."CP_SIGNYN" IS '관리자 업체승인시 Y로 변경';

COMMENT ON COLUMN "COMPANY"."CP_OPEN_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "COMPANY"."CP_CLOSE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "COMPANY"."CP_OPEN_TIME" IS 'HH:MI:SS';

COMMENT ON COLUMN "COMPANY"."CP_CLOSE_TIME" IS 'HH:MI:SS';

COMMENT ON COLUMN "COMPANY"."CP_ADDRESS" IS '주소API 사용';

COMMENT ON COLUMN "COMPANY"."CP_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "COMPANY"."CP_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "MENU" (
	"MENU_NO"	NUMBER		NOT NULL,
	"CP_NO"	NUMBER		NOT NULL,
	"MENU_NAME"	VARCHAR2(100)		NOT NULL,
	"MENU_PRICE"	NUMBER		NOT NULL,
	"MENU_EXPLAIN"	VARCHAR2(1000)		NULL,
	"MENU_USEYN"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"MENU_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"MENU_UPDATE_DATE"	TIMESTAMP		NULL,
	"FL_GNO"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "MENU"."MENU_USEYN" IS '사용 : Y / 미사용 : N';

COMMENT ON COLUMN "MENU"."MENU_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "MENU"."MENU_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "FILE" (
	"FL_GNO"	VARCHAR2(4000)		NOT NULL,
	"FL_NAME"	VARCHAR2(4000)		NULL,
	"FL_RENAME"	VARCHAR2(4000)		NULL,
	"FL_SRC"	VARCHAR2(4000)		NULL,
	"FILE_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
);

COMMENT ON COLUMN "FILE"."FILE_WRITE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "REVIEW" (
	"RV_NO"	NUMBER		NOT NULL,
	"BK_NO"	NUMBER		NOT NULL,
	"RV_SCORE"	NUMBER		NOT NULL,
	"RV_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"RV_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"RV_MODIFY_DATE"	TIMESTAMP		NULL,
	"FL_GNO"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "REVIEW"."RV_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "REVIEW"."RV_MODIFY_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "U_MEMBER" (
	"UM_ID"	VARCHAR2(20)		NOT NULL,
	"UM_PWD"	VARCHAR2(40)		NOT NULL,
	"UM_NAME"	VARCHAR2(20)		NOT NULL,
	"UM_GENDER"	VARCHAR2(1)		NOT NULL,
	"UM_BIRTH"	VARCHAR2(20)		NOT NULL,
	"UM_TEL"	VARCHAR2(20)		NOT NULL,
	"UM_POSTCODE"	VARCHAR2(20)		NOT NULL,
	"UM_ADDRESS"	VARCHAR2(100)		NOT NULL,
	"UM_DETAIL_ADDRESS"	VARCHAR2(100)		NOT NULL,
	"UM_EMAIL"	VARCHAR2(100)		NOT NULL,
	"UM_POINT"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"UM_USEYN"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"UM_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"UM_UPDATE_DATE"	TIMESTAMP		NULL,
	"UM_OUT_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "U_MEMBER"."UM_GENDER" IS '남자 : M / 여자 : F';

COMMENT ON COLUMN "U_MEMBER"."UM_BIRTH" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "U_MEMBER"."UM_TEL" IS '010-0000-0000';

COMMENT ON COLUMN "U_MEMBER"."UM_ADDRESS" IS '주소 API';

COMMENT ON COLUMN "U_MEMBER"."UM_EMAIL" IS 'id@jiwoodong.com';

COMMENT ON COLUMN "U_MEMBER"."UM_USEYN" IS '사용 : Y / 미사용 : N';

COMMENT ON COLUMN "U_MEMBER"."UM_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "U_MEMBER"."UM_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "BOOKING" (
	"BK_NO"	NUMBER		NOT NULL,
	"CP_NO"	NUMBER		NOT NULL,
	"UM_ID"	VARCHAR2(20)		NOT NULL,
	"BK_NAME"	VARCHAR2(20)		NOT NULL,
	"BK_PHONE"	VARCHAR2(20)		NOT NULL,
	"BK_REQUIRE"	VARCHAR2(1000)		NULL,
	"BK_DATE"	VARCHAR2(40)		NOT NULL,
	"BK_CDATE"	TIMESTAMP		NULL,
	"BK_TIME"	VARCHAR2(40)		NOT NULL,
	"BK_STATUS"	VARCHAR2(1)		NOT NULL,
	"BK_TOTAL_PRICE"	NUMBER		NULL,
	"BK_PAY"	VARCHAR2(100)		NULL,
	"BK_VISIT"	VARCHAR2(20)		NULL,
	"BK_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"BK_UPDATE_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "BOOKING"."BK_PHONE" IS '010-0000-0000';

COMMENT ON COLUMN "BOOKING"."BK_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "BOOKING"."BK_CDATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "BOOKING"."BK_TIME" IS 'HH:MI:SS';

COMMENT ON COLUMN "BOOKING"."BK_STATUS" IS '대기 H/ 예약 R / 취소 : C';

COMMENT ON COLUMN "BOOKING"."BK_PAY" IS '결제API';

COMMENT ON COLUMN "BOOKING"."BK_VISIT" IS '차량 / 도보';

COMMENT ON COLUMN "BOOKING"."BK_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "BOOKING"."BK_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "B_QnA" (
	"BQ_NO"	NUMBER		NOT NULL,
	"UM_ID"	VARCHAR2(20)		NOT NULL,
	"CP_NO"	NUMBER		NOT NULL,
	"BQ_TITLE"	VARCHAR2(20)		NOT NULL,
	"BQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BQ_ANSWER"	VARCHAR2(4000)		NULL,
	"BQ_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"BQ_UPDATE_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "B_QnA"."BQ_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "B_QnA"."BQ_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "B_MENU" (
	"BK_NO"	NUMBER		NOT NULL,
	"MENU_NO"	NUMBER		NOT NULL,
	"BKM_COUNT"	NUMBER	DEFAULT 1	NOT NULL,
	"BKM_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"BKM_UPDATE_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "B_MENU"."BKM_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "B_MENU"."BKM_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "U_BOOKMARK" (
	"UB_NO"	NUMBER		NOT NULL,
	"UM_ID"	VARCHAR2(20)		NOT NULL,
	"CP_NO"	NUMBER		NOT NULL,
	"UB_WRITEDATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
);

COMMENT ON COLUMN "U_BOOKMARK"."UB_WRITEDATE" IS 'YYYY/MM/DD';

CREATE TABLE "ADMIN" (
	"AD_NO"	NUMBER		NOT NULL,
	"AD_ID"	VARCHAR2(20)		NOT NULL,
	"AD_PW"	VARCHAR2(40)		NOT NULL
);

CREATE TABLE "NOTICE" (
	"NT_NO"	NUMBER		NOT NULL,
	"NT_TITLE"	VARCHAR2(300)		NOT NULL,
	"NT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"NT_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"NT_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"FL_GNO"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "NOTICE"."NT_WRITE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "CLAUSE" (
	"CU_CODE"	NUMBER		NOT NULL,
	"CU_NAME"	VARCHAR2(20)		NOT NULL,
	"CU_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CU_REQURIRED"	VARCHAR2(1)		NOT NULL
);

COMMENT ON COLUMN "CLAUSE"."CU_CODE" IS '이용약관 01/개인정보수집 및 이용 동의 02/위치정보서비스 동의03';

COMMENT ON COLUMN "CLAUSE"."CU_NAME" IS '이용약관동의/개인정보 수집 및 이용 동의/위치정보서비스 동의';

COMMENT ON COLUMN "CLAUSE"."CU_REQURIRED" IS '필수 : Y / 필수 아님 : N';

CREATE TABLE "A_QnA" (
	"AQ_NO"	NUMBER		NOT NULL,
	"AD_NO"	NUMBER		NOT NULL,
	"BU_NO"	NUMBER		NOT NULL,
	"AQ_TITLE"	VARCHAR2(20)		NOT NULL,
	"AQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"AQ_ANSWER"	VARCHAR2(4000)		NULL,
	"AQ_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"AQ_UPDATE_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "A_QnA"."AQ_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "A_QnA"."AQ_UPDATE_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "C_AGREE" (
	"CU_CODE"	NUMBER		NOT NULL,
	"UM_ID"	VARCHAR2(20)		NOT NULL,
	"CU_AGREE"	VARCHAR2(1)		NOT NULL,
	"CU_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"BU_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "C_AGREE"."CU_CODE" IS '이용약관 01/개인정보수집 및 이용 동의 02/위치정보서비스 동의03';

COMMENT ON COLUMN "C_AGREE"."CU_AGREE" IS '동의 : Y / 미동의 : N';

COMMENT ON COLUMN "C_AGREE"."CU_DATE" IS 'YYYY/MM/DD';

CREATE TABLE "U_QnA" (
	"UQ_NO"	NUMBER		NOT NULL,
	"UM_ID"	VARCHAR2(20)		NOT NULL,
	"UQ_TITLE"	VARCHAR2(20)		NOT NULL,
	"UQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"UQ_ANSWER"	VARCHAR2(4000)		NULL,
	"UQ_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"UQ_UPDATE_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "U_QnA"."UQ_WRITE_DATE" IS 'YYYY/MM/DD';

COMMENT ON COLUMN "U_QnA"."UQ_UPDATE_DATE" IS 'YYYY/MM/DD';

ALTER TABLE "B_MEMBER" ADD CONSTRAINT "PK_B_MEMBER" PRIMARY KEY (
	"BU_NO"
);

ALTER TABLE "COMPANY" ADD CONSTRAINT "PK_COMPANY" PRIMARY KEY (
	"CP_NO"
);

ALTER TABLE "MENU" ADD CONSTRAINT "PK_MENU" PRIMARY KEY (
	"MENU_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY (
	"FL_GNO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"RV_NO"
);

ALTER TABLE "U_MEMBER" ADD CONSTRAINT "PK_U_MEMBER" PRIMARY KEY (
	"UM_ID"
);

ALTER TABLE "BOOKING" ADD CONSTRAINT "PK_BOOKING" PRIMARY KEY (
	"BK_NO"
);

ALTER TABLE "B_QnA" ADD CONSTRAINT "PK_B_QNA" PRIMARY KEY (
	"BQ_NO"
);

ALTER TABLE "U_BOOKMARK" ADD CONSTRAINT "PK_U_BOOKMARK" PRIMARY KEY (
	"UB_NO"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"AD_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NT_NO"
);

ALTER TABLE "CLAUSE" ADD CONSTRAINT "PK_CLAUSE" PRIMARY KEY (
	"CU_CODE"
);

ALTER TABLE "A_QnA" ADD CONSTRAINT "PK_A_QNA" PRIMARY KEY (
	"AQ_NO"
);

ALTER TABLE "U_QnA" ADD CONSTRAINT "PK_U_QNA" PRIMARY KEY (
	"UQ_NO"
);

ALTER TABLE "B_MEMBER" ADD CONSTRAINT "FK_FILE_TO_B_MEMBER_1" FOREIGN KEY (
	"FL_GNO"
)
REFERENCES "FILE" (
	"FL_GNO"
);

ALTER TABLE "COMPANY" ADD CONSTRAINT "FK_B_MEMBER_TO_COMPANY_1" FOREIGN KEY (
	"BU_NO"
)
REFERENCES "B_MEMBER" (
	"BU_NO"
);

ALTER TABLE "COMPANY" ADD CONSTRAINT "FK_FILE_TO_COMPANY_1" FOREIGN KEY (
	"FL_GNO"
)
REFERENCES "FILE" (
	"FL_GNO"
);

ALTER TABLE "MENU" ADD CONSTRAINT "FK_COMPANY_TO_MENU_1" FOREIGN KEY (
	"CP_NO"
)
REFERENCES "COMPANY" (
	"CP_NO"
);

ALTER TABLE "MENU" ADD CONSTRAINT "FK_FILE_TO_MENU_1" FOREIGN KEY (
	"FL_GNO"
)
REFERENCES "FILE" (
	"FL_GNO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOOKING_TO_REVIEW_1" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOKING" (
	"BK_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_FILE_TO_REVIEW_1" FOREIGN KEY (
	"FL_GNO"
)
REFERENCES "FILE" (
	"FL_GNO"
);

ALTER TABLE "BOOKING" ADD CONSTRAINT "FK_COMPANY_TO_BOOKING_1" FOREIGN KEY (
	"CP_NO"
)
REFERENCES "COMPANY" (
	"CP_NO"
);

ALTER TABLE "BOOKING" ADD CONSTRAINT "FK_U_MEMBER_TO_BOOKING_1" FOREIGN KEY (
	"UM_ID"
)
REFERENCES "U_MEMBER" (
	"UM_ID"
);

ALTER TABLE "B_QnA" ADD CONSTRAINT "FK_U_MEMBER_TO_B_QnA_1" FOREIGN KEY (
	"UM_ID"
)
REFERENCES "U_MEMBER" (
	"UM_ID"
);

ALTER TABLE "B_QnA" ADD CONSTRAINT "FK_COMPANY_TO_B_QnA_1" FOREIGN KEY (
	"CP_NO"
)
REFERENCES "COMPANY" (
	"CP_NO"
);

ALTER TABLE "B_MENU" ADD CONSTRAINT "FK_BOOKING_TO_B_MENU_1" FOREIGN KEY (
	"BK_NO"
)
REFERENCES "BOOKING" (
	"BK_NO"
);

ALTER TABLE "B_MENU" ADD CONSTRAINT "FK_MENU_TO_B_MENU_1" FOREIGN KEY (
	"MENU_NO"
)
REFERENCES "MENU" (
	"MENU_NO"
);

ALTER TABLE "U_BOOKMARK" ADD CONSTRAINT "FK_U_MEMBER_TO_U_BOOKMARK_1" FOREIGN KEY (
	"UM_ID"
)
REFERENCES "U_MEMBER" (
	"UM_ID"
);

ALTER TABLE "U_BOOKMARK" ADD CONSTRAINT "FK_COMPANY_TO_U_BOOKMARK_1" FOREIGN KEY (
	"CP_NO"
)
REFERENCES "COMPANY" (
	"CP_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_FILE_TO_NOTICE_1" FOREIGN KEY (
	"FL_GNO"
)
REFERENCES "FILE" (
	"FL_GNO"
);

ALTER TABLE "A_QnA" ADD CONSTRAINT "FK_ADMIN_TO_A_QnA_1" FOREIGN KEY (
	"AD_NO"
)
REFERENCES "ADMIN" (
	"AD_NO"
);

ALTER TABLE "A_QnA" ADD CONSTRAINT "FK_B_MEMBER_TO_A_QnA_1" FOREIGN KEY (
	"BU_NO"
)
REFERENCES "B_MEMBER" (
	"BU_NO"
);

ALTER TABLE "C_AGREE" ADD CONSTRAINT "FK_CLAUSE_TO_C_AGREE_1" FOREIGN KEY (
	"CU_CODE"
)
REFERENCES "CLAUSE" (
	"CU_CODE"
);

ALTER TABLE "C_AGREE" ADD CONSTRAINT "FK_U_MEMBER_TO_C_AGREE_1" FOREIGN KEY (
	"UM_ID"
)
REFERENCES "U_MEMBER" (
	"UM_ID"
);

ALTER TABLE "C_AGREE" ADD CONSTRAINT "FK_B_MEMBER_TO_C_AGREE_1" FOREIGN KEY (
	"BU_NO"
)
REFERENCES "B_MEMBER" (
	"BU_NO"
);

ALTER TABLE "U_QnA" ADD CONSTRAINT "FK_U_MEMBER_TO_U_QnA_1" FOREIGN KEY (
	"UM_ID"
)
REFERENCES "U_MEMBER" (
	"UM_ID"
);

-- 관리자 시퀀스
CREATE SEQUENCE ADMIN_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 사업자 회원 시퀀스
CREATE SEQUENCE B_MEMBER_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 사업자 업체 시퀀스
CREATE SEQUENCE COMPANY_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 예약 시퀀스
CREATE SEQUENCE BOOKING_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 리뷰 시퀀스
CREATE SEQUENCE REVIEW_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 사업자 업체 메뉴 시퀀스
CREATE SEQUENCE MENU_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 관리자 게시판 시퀀스
CREATE SEQUENCE A_QNA_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 사업자 게시판 시퀀스
CREATE SEQUENCE B_QNA_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 사용자 게시판 시퀀스
CREATE SEQUENCE U_QNA_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 약관 동의 이력 시퀀스
CREATE SEQUENCE C_AGREE_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 즐겨찾기 시퀀스
CREATE SEQUENCE U_BOOKMARK_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
-- 공지사항 시퀀스
CREATE SEQUENCE NOTICE_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;



-- ============================================================ --

-- ADMIN

-- 자료형 확인
DESC ADMIN;
--이름    널?       유형           
------- -------- ------------ 
--AD_NO NOT NULL NUMBER       
--AD_ID NOT NULL VARCHAR2(20) 
--AD_PW NOT NULL VARCHAR2(40)

-- ADMIN 추가
INSERT INTO ADMIN VALUES (ADMIN_SEQ.NEXTVAL, 'ADMIN1', 'ADMIN1');
INSERT INTO ADMIN VALUES (ADMIN_SEQ.NEXTVAL, 'ADMIN2', 'ADMIN2');
INSERT INTO ADMIN VALUES (ADMIN_SEQ.NEXTVAL, 'ADMIN3', 'ADMIN3');
COMMIT;

-- ADMIN 확인
SELECT AD_NO AS 관리자번호, AD_ID AS 관리자ID, AD_PW AS 관리자PW 
FROM ADMIN;

-- ============================================================ --

-- 공지사항
-- 자료형 확인
DESC NOTICE;
--이름            널?       유형             
--------------- -------- -------------- 
--NT_NO         NOT NULL NUMBER         
--NT_TITLE      NOT NULL VARCHAR2(300)  
--NT_CONTENT             VARCHAR2(4000) 
--NT_WRITE_DATE NOT NULL TIMESTAMP(6)   
--NT_COUNT      NOT NULL NUMBER         
--FL_GNO                 VARCHAR2(4000) 

-- 공지사항 글 등록
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL, '지우동 사이트 문의합니다.', '사이트 어쩜 이렇게 멋지게 만드셨죠? 혹시 조장이 누구인가요?', DEFAULT, DEFAULT, NULL);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL, '서비스 점검 예정(4/16)', '서버 안정화를 위해 서비스 점검이 진행됩니다. 다들 나가주세요. 혼자있고 싶어요', DEFAULT, DEFAULT, NULL);
INSERT INTO NOTICE VALUES (NOTICE_SEQ.NEXTVAL, '지우동 주문 POS위젯 장애 안내', '사이트가 정신 못차리네요 오류 해결하고 오겠습니다 !', DEFAULT, DEFAULT, NULL);
COMMIT;

-- 공지사항 1번 글 수정
UPDATE NOTICE
SET NT_TITLE = '지우동 사이트 오픈 안내', NT_CONTENT = '지우동 사이트는 예약시스템으로 5월 오픈입니다. 여러분들 환영합니다.'
WHERE NT_NO = 1;
COMMIT;

-- 공지사항 3번 글 삭제
DELETE FROM NOTICE
WHERE NT_NO = 3;
COMMIT;

-- 공지사항 조회
SELECT NT_NO AS 글번호, NT_TITLE AS "공지사항 제목", NT_CONTENT AS "공지사항 내용", TO_CHAR(NT_WRITE_DATE, 'YYYY/MM/DD') AS 등록일, NT_COUNT AS 조회수
FROM NOTICE;

-- ============================================================ --

-- 사업자 회원 테이블 자료형 확인
DESC B_MEMBER;
--이름             널?       유형             
---------------- -------- -------------- 
--BU_NO          NOT NULL NUMBER         
--BU_ID          NOT NULL VARCHAR2(20)   
--BU_NUMBER      NOT NULL VARCHAR2(20)   
--BU_PWD         NOT NULL VARCHAR2(40)   
--BU_NAME        NOT NULL VARCHAR2(20)   
--BU_BIRTH       NOT NULL VARCHAR2(20)   
--BU_GENDER      NOT NULL VARCHAR2(1)    
--BU_EMAIL       NOT NULL VARCHAR2(100)  
--BU_TEL         NOT NULL VARCHAR2(20)   
--BU_USEYN       NOT NULL VARCHAR2(1)    
--BU_WRITE_DATE           TIMESTAMP(6)   
--BU_UPDATE_DATE          TIMESTAMP(6)   
--BU_OUT_DATE             TIMESTAMP(6)   
--FL_GNO                  VARCHAR2(4000)  

-- 사업자 회원가입
INSERT INTO B_MEMBER VALUES (B_MEMBER_SEQ.NEXTVAL, 'BUSINESS1', '123-45-67890', 'BUSINESS1', 
                            '빡빡이', '1992/10/23', 'F', 'bbabbaki@naver.com', '010-0000-0000', 
                            DEFAULT, DEFAULT, NULL, NULL, NULL);
INSERT INTO B_MEMBER VALUES (B_MEMBER_SEQ.NEXTVAL, 'BUSINESS2', '098-76-54321', 'BUSINESS2', 
                            '커피줘', '1992/9/23', 'F', 'giveme@naver.com', '010-1111-1111', 
                            DEFAULT, DEFAULT, NULL, NULL, NULL);
COMMIT;



-- 사업자 확인
SELECT BU_NO NO, BU_ID 아이디, BU_NUMBER 사업자번호, BU_PWD 비밀번호, BU_NAME 이름, BU_BIRTH 생년월일, BU_GENDER 성별,
       BU_EMAIL 이메일, BU_TEL 전화번호, BU_USEYN 사용여부, TO_CHAR(BU_WRITE_DATE, 'YYYY/MM/DD') 가입일, 
       TO_CHAR(BU_UPDATE_DATE, 'YYYY/MM/DD') 수정일, TO_CHAR(BU_OUT_DATE, 'YYYY/MM/DD') 탈퇴일
FROM B_MEMBER;

-- 사업자 업체 등록 자료형 확인
DESC COMPANY;
--이름             널?       유형             
---------------- -------- -------------- 
--CP_NO          NOT NULL NUMBER         
--BU_NO          NOT NULL NUMBER         
--CP_CATEGORY    NOT NULL VARCHAR2(20)   
--CP_NAME        NOT NULL VARCHAR2(20)   
--CP_EXPLAIN              VARCHAR2(4000) 
--CP_CLASSIFY    NOT NULL VARCHAR2(1)    
--CP_SIGNYN      NOT NULL VARCHAR2(1) 
--CP_OPEN_DATE            VARCHAR2(40)   
--CP_CLOSE_DATE           VARCHAR2(40)   
--CP_OPEN_TIME            VARCHAR2(40)   
--CP_CLOSE_TIME           VARCHAR2(40)   
--CP_TERM                 VARCHAR2(100)  
--CP_POSTCODE    NOT NULL VARCHAR2(20)   
--CP_ADDRESS     NOT NULL VARCHAR2(200)  
--CP_DTADDRESS   NOT NULL VARCHAR2(1000) 
--CP_WRITE_DATE           TIMESTAMP(6)   
--CP_UPDATE_DATE          TIMESTAMP(6)   
--FL_GNO                  VARCHAR2(4000) 

SELECT BU_NO FROM B_MEMBER WHERE BU_NUMBER = '123-45-67890';
-- 사업자 업체 등록
INSERT INTO COMPANY VALUES(COMPANY_SEQ.NEXTVAL, (SELECT BU_NO FROM B_MEMBER WHERE BU_NUMBER = '123-45-67890'), '미용실', '빡빡미러', 
                            '빡빡미러는 바리깡 20년 전문가가 속 시원하게 머리를 밀어드립니다.', 
                            'A', DEFAULT, NULL, NULL, NULL, NULL, NULL, 33333, '경기도 의정부시', '의정부동 333-33', DEFAULT, NULL, NULL);
COMMIT;        

SELECT * FROM B_MEMBER;
SELECT * FROM COMPANY;

-- 업체 등록 시 조회(업체명, 사업자 등록번호, 업종, 상세설명, 전화번호, 우편번호, 주소, 상세주소, 승인여부 필요함)
SELECT C.CP_NAME 업체명, B.BU_NUMBER 사업자번호, C.CP_CATEGORY 업종, C.CP_EXPLAIN 업체설명, 
        C.CP_POSTCODE 우편번호, CP_ADDRESS 주소, CP_DTADDRESS 상세주소, C.CP_SIGNYN 승인여부
FROM COMPANY C
JOIN B_MEMBER B ON (C.BU_NO = B.BU_NO)
WHERE C.CP_SIGNYN = 'N';

-- 사업자 업체 승인
-- 신청 양식이 일치했을 때
UPDATE COMPANY
SET CP_SIGNYN = 'Y'
WHERE BU_NO = (SELECT BU_NO FROM B_MEMBER WHERE BU_NUMBER = '123-45-67890');


-- 업체 승인 후 조회(업체명, 사업자 등록번호, 업종, 상세설명, 전화번호, 우편번호, 주소, 상세주소, 승인여부 필요함)
SELECT C.CP_NAME 업체명, B.BU_NUMBER 사업자번호, C.CP_CATEGORY 업종, C.CP_EXPLAIN 업체설명, 
        C.CP_POSTCODE 우편번호, CP_ADDRESS 주소, CP_DTADDRESS 상세주소, C.CP_SIGNYN 승인여부
FROM COMPANY C
JOIN B_MEMBER B ON (C.BU_NO = B.BU_NO)
WHERE C.CP_SIGNYN = 'Y';


-- ============================================================ --

-- 사업자 회원 조회
SELECT BU_NO NO, BU_NUMBER 사업자번호, BU_ID 아이디, BU_NAME 이름, BU_BIRTH 생년월일, BU_EMAIL 이메일
     , BU_TEL 전화번호, TO_CHAR(BU_WRITE_DATE, 'YYYY/MM/DD') 가입일, BU_USEYN 사용여부
FROM B_MEMBER
WHERE BU_USEYN = 'Y';

-- 사업자 회원 수정(요청 예-전화번호가 변경되었어요 수정해주세요, 요청자아이디 : BUSINESS1)
UPDATE B_MEMBER
SET BU_TEL = '010-1234-5678'
WHERE BU_ID = 'BUSINESS1';
COMMIT;

-- 사업자 회원 탈퇴(요청 예-저 탈퇴시켜주세요, 요청자아이디 : BUSINESS2)
UPDATE B_MEMBER
SET BU_USEYN = 'N', BU_OUT_DATE = SYSTIMESTAMP
WHERE BU_ID = 'BUSINESS2';
COMMIT;

-- 사업자 회원 탈퇴자 조회
SELECT BU_NO NO, BU_NUMBER 사업자번호, BU_ID 아이디, BU_NAME 이름, BU_BIRTH 생년월일, BU_EMAIL 이메일
     , BU_TEL 전화번호, TO_CHAR(BU_WRITE_DATE, 'YYYY/MM/DD') 가입일
     , BU_USEYN 사용여부, TO_CHAR(BU_OUT_DATE, 'YYYY/MM/DD') 탈퇴일
FROM B_MEMBER
WHERE BU_USEYN = 'N';



-- ============================================================ --

-- 사용자 회원 

-- 자료형 확인
DESC U_MEMBER;

--이름                널?       유형            
------------------- -------- ------------- 
--UM_ID             NOT NULL VARCHAR2(20)  
--UM_PWD            NOT NULL VARCHAR2(40)  
--UM_NAME           NOT NULL VARCHAR2(20)  
--UM_GENDER         NOT NULL VARCHAR2(1)   
--UM_BIRTH          NOT NULL VARCHAR2(20)  
--UM_TEL            NOT NULL VARCHAR2(20)  
--UM_POSTCODE       NOT NULL VARCHAR2(20)  
--UM_ADDRESS        NOT NULL VARCHAR2(100) 
--UM_DETAIL_ADDRESS NOT NULL VARCHAR2(100) 
--UM_EMAIL          NOT NULL VARCHAR2(100)
--UM_POINT          NOT NULL NUMBER(10)  
--UM_USEYN          NOT NULL VARCHAR2(1)   
--UM_WRITE_DATE              TIMESTAMP(6)  
--UM_UPDATE_DATE             TIMESTAMP(6)  
--UM_OUT_DATE                TIMESTAMP(6)  

-- 사용자 회원 데이터 추가
INSERT INTO U_MEMBER VALUES ('USER1', 'USER1', '소는진', 'F', '1992/10/23', '010-6621-1234', 
                             '12345', '경기도 의정부시', '장암동 아파트', 'ej@jiwoodong.com', '300000', 
                             DEFAULT, DEFAULT, NULL, NULL);
INSERT INTO U_MEMBER VALUES ('USER2', 'USER2', '모찌아빠', 'M', '1991/3/25', '010-9876-1234', 
                             '93933', '서울시', '강동구', 'cat@jiwoodong.com', '10000', 
                             DEFAULT, DEFAULT, NULL, NULL);
COMMIT;

SELECT * FROM U_MEMBER;

-- 사용자 회원 조회
SELECT UM_ID 아이디, UM_PWD 비밀번호, UM_NAME 이름, UM_GENDER 성별, UM_BIRTH 생년월일, UM_TEL 전화번호
     , UM_POSTCODE 우편번호, UM_ADDRESS 주소, UM_DETAIL_ADDRESS 상세주소, UM_EMAIL, UM_POINT 적립금
     , UM_USEYN 사용여부, TO_CHAR(UM_WRITE_DATE, 'YYYY/MM/DD') 등록일
FROM U_MEMBER
WHERE UM_USEYN = 'Y';

-- 사용자 회원 수정(요청 - 개명했어요, 요청자아이디 : USER2)
UPDATE U_MEMBER
SET UM_NAME = '모찌아범'
WHERE UM_ID = 'USER2';
COMMIT;

-- 사용자 회원 탈퇴(요청 - 탈퇴하고 싶어요, 요청자아이디 : USER2)
UPDATE U_MEMBER
SET UM_USEYN = 'N', UM_OUT_DATE = SYSTIMESTAMP
WHERE UM_ID = 'USER2';

-- 사용자 회원 탈퇴자 조회
SELECT UM_ID 아이디, UM_PWD 비밀번호, UM_NAME 이름, UM_GENDER 성별, UM_BIRTH 생년월일, UM_TEL 전화번호
     , UM_POSTCODE 우편번호, UM_ADDRESS 주소, UM_DETAIL_ADDRESS 상세주소, UM_EMAIL, UM_POINT 적립금
     , UM_USEYN 사용여부, TO_CHAR(UM_WRITE_DATE, 'YYYY/MM/DD') 등록일, TO_CHAR(UM_OUT_DATE, 'YYYY/MM/DD') 탈퇴일
FROM U_MEMBER
WHERE UM_USEYN = 'N';





-- ======================== 재우오빠쿼리 ======================= --


-- 지우동 사업자 회원가입
insert into b_member(bu_no, bu_number, bu_id, bu_pwd, bu_name, bu_birth, bu_gender, bu_email, bu_tel) 
values(b_member_seq.nextval, '5555-5555', 'blue', 'blue512@@', '나블루', '1999-09-09', 'M', 'blue@blue.blue', '010-5555-5555');
insert into b_member(bu_no, bu_number, bu_id, bu_pwd, bu_name, bu_birth, bu_gender, bu_email, bu_tel) 
values(b_member_seq.nextval, '3333-3333', 'yellow', 'yellow312@@', '나노랑', '1999-09-09', 'M', 'yellow@yellow.yellow', '010-3333-3333');

-- 지우동 사용자 회원가입
insert into u_member(um_id, um_pwd, um_name, um_gender, um_birth, um_tel, um_postcode, um_address, um_detail_address, um_email)
values('aaa', 'aaa', '회원1', 'M', '1999-09-09', '010-1111-1111', '00000', '화곡동', '동화빌라', 'aaa@aaa.com');
insert into u_member(um_id, um_pwd, um_name, um_gender, um_birth, um_tel, um_postcode, um_address, um_detail_address, um_email)
values('bbb', 'bbb', '회원2', 'M', '1999-09-09', '010-2222-2222', '00000', '관악구', '신림동', 'bbb@bbb.com');

-- 지우동 업체 등록
insert into company(cp_no, bu_no, cp_category, cp_name, cp_explain, cp_classify, cp_open_date, cp_close_date, cp_open_time, cp_close_time, cp_term, cp_postcode, cp_address, cp_dtaddress)
values(company_seq.nextval, (select bu_no from b_member where bu_id='blue'), '미용실', '블루클럽', '머리를 시원한 파란색으로', 'A', '2022-04-11', '2022-04-12', '09:30:00', '21:00:00', '00:30:00', '00000', '은평구', '불광동');
insert into company(cp_no, bu_no, cp_category, cp_name, cp_explain, cp_classify, cp_open_date, cp_close_date, cp_open_time, cp_close_time, cp_term, cp_postcode, cp_address, cp_dtaddress)
values(company_seq.nextval, (select bu_no from b_member where bu_id='yellow'), '호텔', '모찌호텔', '모찌전용호텔', 'A', '2022-04-11', '2022-04-12', '00:00:00', '24:00:00', '00:30:00', '00000', '강서구', '발산동');

-- 지우동 업체 메뉴 등록
insert into menu(menu_no, cp_no, menu_name, menu_price, menu_explain)
values(menu_seq.nextval, (select cp_no from company join b_member on company.bu_no = b_member.bu_no where b_member.bu_id='blue'), '서해안 고속도로', '1000000', '서해안 고속도로처럼 시원하게');
insert into menu(menu_no, cp_no, menu_name, menu_price, menu_explain)
values(menu_seq.nextval, (select cp_no from company join b_member on company.bu_no = b_member.bu_no where b_member.bu_id='blue'), '중부 고속도로', '1100000', '중부 고속도로처럼 화끈하게');
insert into menu(menu_no, cp_no, menu_name, menu_price, menu_explain)
values(menu_seq.nextval, (select cp_no from company join b_member on company.bu_no = b_member.bu_no where b_member.bu_id='yellow'), '캣타워', '1110000', '흔들리지 않는 편안함');
insert into menu(menu_no, cp_no, menu_name, menu_price, menu_explain)
values(menu_seq.nextval, (select cp_no from company join b_member on company.bu_no = b_member.bu_no where b_member.bu_id='yellow'), '캣폴', '2220000', '펜트하우스');


-- 지우동 예약 등록, 예약 메뉴등록
DESC B_MENU;
--이름              널?       유형            
----------------- -------- ------------- 
--BK_NO           NOT NULL NUMBER        
--MENU_NO         NOT NULL NUMBER        
--BKM_NAME        NOT NULL VARCHAR2(100) 
--BKM_PRICE       NOT NULL NUMBER        
--BKM_COUNT       NOT NULL NUMBER        
--BKM_WRITE_DATE           TIMESTAMP(6)  
--BKM_UPDATE_DATE          TIMESTAMP(6)  
insert into booking(bk_no, cp_no, um_id, bk_name, bk_phone, bk_require, bk_date, bk_time, bk_status)  
values(booking_seq.nextval, 1, 'aaa', '모찌', '010-5252-5252', '털갈이 시즌이 왔어요', '2022-04-13', '13:00:00', 'R');
insert into b_menu(bk_no, menu_no, bkm_name, bkm_price, bkm_count)
values(1, 1, (select menu_name from menu where menu_no = 1),(select menu_price from menu where menu_no = 1), DEFAULT);
insert into booking(bk_no, cp_no, um_id, bk_name, bk_phone, bk_require, bk_date, bk_time, bk_status)  
values(booking_seq.nextval, 2, 'bbb', '모찌', '010-2525-2525', '가출했어요', '2022-04-13', '13:00:00', 'R');
insert into b_menu(bk_no, menu_no, bkm_name, bkm_price, bkm_count)
values(2, 3, (select menu_name from menu where menu_no = 3),(select menu_price from menu where menu_no = 3), DEFAULT);
insert into booking(bk_no, cp_no, um_id, bk_name, bk_phone, bk_require, bk_date, bk_time, bk_status)  
values(booking_seq.nextval, 2, 'bbb', '모찌', '010-2525-2525', '가출했어요', '2022-04-13', '13:00:00', 'R');
insert into b_menu(bk_no, menu_no, bkm_name, bkm_price, bkm_count)
values(2, 4, (select menu_name from menu where menu_no = 4),(select menu_price from menu where menu_no = 4), DEFAULT);

commit;

SELECT * FROM B_MENU;

select * from b_member;
select * from u_member;
select * from company;
select * from menu;
select * from booking;

select * from booking join b_menu using (bk_no);





-- ============================================================ --

-- 사용자 : 내 정보 관리 


-- 조회, 수정, 회원 탈퇴
SELECT * FROM BOOKING;
SELECT BK_NO 예약번호, CP_NO 업체번호, UM_ID 사용자아이디, BK_NAME 예약자성함, BK_PHONE 예약자연락처, BK_REQUIRE 요청사항,
    BK_DATE 예약날짜, BK_CDATE 취소날짜, BK_TIME 예약시간, BK_STATUS 예약상태, BK_TOTAL_PRICE 결제금액, BK_PAY 결제수단,
    BK_VISIT 방문수단, TO_CHAR(BK_WRITE_DATE, 'YYYY/MM/DD') 등록일, TO_CHAR(BK_UPDATE_DATE, 'YYYY/MM/DD') 수정일
FROM BOOKING;
-- 예약 현황 조회
-- 업체명, 예약날짜, 예약시간, 예약메뉴, 결제금액
SELECT * FROM B_MENU;
SELECT BK_NO 예약번호, MENU_NO 메뉴번호, BKM_NAME 메뉴명, BKM_PRICE 메뉴가격, BKM_COUNT 수량,
    TO_CHAR(BKM_WRITE_DATE, 'YYYY/MM/DD') 등록일, TO_CHAR(BKM_UPDATE_DATE, 'YYYY/MM/DD') 수정일
FROM B_MENU;
--SELECT 
--FROM B_MENU BM;

-----------------------------------------------------------------------------
--전승희 
--사용자 회원가입 insert
insert into u_member(um_id, um_pwd, um_name, um_gender, um_birth, um_tel, um_postcode, um_address, um_detail_address, um_email)
    VALUES ('dog1','dog1','김뽀삐','M','2000-01-01','010-1004-1004','11111','제주특별시', '귤마을', 'cathater@aaa.com');    
insert into u_member(um_id, um_pwd, um_name, um_gender, um_birth, um_tel, um_postcode, um_address, um_detail_address, um_email)
    VALUES ('cat1','cat1','최나비','F','2000-01-11','010-1114-1004','11112','서울특별시', '마니산', 'doghater@aaa.com'); 
--사업자 회원가입 nsert

INSERT INTO B_MEMBER VALUES (B_MEMBER_SEQ.NEXTVAL, '333-33-33333', 'BUSER3', 'BUSER3', 
                            '카페인중독', '1990/10/20', 'F', 'COFFEE@naver.com', '010-3333-3333', 
                            DEFAULT, DEFAULT, NULL, NULL, NULL);
INSERT INTO B_MEMBER VALUES (B_MEMBER_SEQ.NEXTVAL, '444-44-44446', 'BUSER4', 'BUSER4', 
                            '통금있는애숙이', '1980/12/23', 'M', 'loveinside@naver.com', '010-1221-1221', 
                            DEFAULT, DEFAULT, NULL, NULL, NULL);
--업체 등록 insert
insert into company(cp_no,bu_no,cp_category,cp_name,cp_explain,cp_classify,cp_postcode,cp_address,cp_dtaddress) 
values (company_seq.nextval,7,'카페','카페인금단현상','카페인중독 마셔서 이겨내자 아자아자','A','1119-11119','파주','영어마을');
insert into company(cp_no,bu_no,cp_category,cp_name,cp_explain,cp_classify,cp_postcode,cp_address,cp_dtaddress) 
values (company_seq.nextval,8,'호텔','애숙이는통금있어요','애숙아해가졌잖니어디니','A','8282-82828','부산','땅끝마을');
--예약 insert
insert into booking(BK_NO,CP_NO,BK_NAME,UM_ID,BK_PHONE,BK_DATE,BK_TIME,BK_STATUS,BK_PRICE,BK_PAY)
    values (booking_seq.nextval,3,'김뽀삐','dog1','010-1004-1004','2022-04-16','00:00:00','R','12000','Y');
insert into booking(BK_NO,CP_NO,BK_NAME,UM_ID,BK_PHONE,BK_DATE,BK_TIME,BK_STATUS,BK_PRICE,BK_PAY)
    values (booking_seq.nextval,4,'김뽀삐','dog1','010-1004-1004','2022-04-16','00:00:00','R','12000','Y');
--리뷰 insert
insert into review(rv_no,bk_no,rv_score,rv_content,rv_write_date) 
    values (review_seq.nextval,10,4,'여기 커피를 마시고 편두통이 사라졌어요 근데 강아지커피똥은 없나요','2022-04-20');
insert into review(rv_no,bk_no,rv_score,rv_content,rv_write_date) 
    values (review_seq.nextval,11,5,'애숙이2호점이란 소리듣고 왔는데 역시 5성급호텔 맞네요 오줌패드가 아주 푹식푹신해요','2022-04-22');
    
--약관 insert

INSERT INTO CLAUSE VALUES (01,'이용약관','이용약관에 동의합니다.','Y');
INSERT INTO CLAUSE VALUES (02,'개인정보수집및이용','개인정보수집 및 이용에 동의합니다.','Y');
INSERT INTO CLAUSE VALUES (03,'위치정보서비스','위치 정보 제공 서비스에 동의합니다.','N');
INSERT INTO CLAUSE VALUES (04,'환불약관','환불약관 서비스에 동의합니다.','Y');

------------------------------------------------------------------
--최규식--

--사용자--
INSERT INTO U_MEMBER(UM_ID, UM_PWD, UM_NAME, UM_GENDER, UM_BIRTH, UM_TEL,UM_POSTCODE, UM_ADDRESS, UM_DETAIL_ADDRESS, UM_EMAIL)
VALUES('HELLOWORLD', '1234', '사람', 'M', '1994-01-23', '010-1234-5678', '12345', '인천광역시', '서구', 'HELLOW@WORLD.COM');
INSERT INTO U_MEMBER(UM_ID, UM_PWD, UM_NAME, UM_GENDER, UM_BIRTH, UM_TEL,UM_POSTCODE, UM_ADDRESS, UM_DETAIL_ADDRESS, UM_EMAIL)
VALUES('GOODBYEWORLD', '5678', '사람2', 'F', '2020-01-01', '010-1565-4564', '56789', '알아서', '뭐하게', 'GOODBYE@WORLD.COM');

--사업자--
--INSERT INTO B_MEMBER(BU_NO, BU_NUMBER, BU_ID, BU_PWD, BU_NAME, BU_BIRTH, BU_GENDER, BU_EMAIL, BU_TEL)
--VALUES('001', '1234545645', '나는야사업자', '비밀', '노코멘트', '2021-02-21','M', 'BU@EMAIL.COM', '010-5645-1561' );

--예약--
--INSERT INTO BOOKING(BK_NO, CP_NO, UM_ID, BK_NAME, BK_PHONE, BK_REQUIRE, BK_DATE, BK_TIME, BK_STATUS, BK_VISIT)
--VALUES('123012', '0001', 'HELLOWORLD','사람', '010-1234-5678', '단무지많이', '2022-04-20', '15:00', 'H', '도보');

--예약 메뉴--
--INSERT INTO B_MENU(BK_NO, MENU_NO, BKM_NAME, BKM_PAY)
--VALUES('00001', '001', '아아', '카드');
