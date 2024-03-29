--------------------------------------------------------
--  DDL for Table CLOSED_DAY
--------------------------------------------------------

  CREATE TABLE "GZONE"."CLOSED_DAY" 
   (	"CLOSED_IDX" NUMBER, 
	"TOUR_IDX" NUMBER, 
	"CLOSED_START_DATE" DATE, 
	"CLOSED_END_DATE" DATE, 
	"CLOSED_CONTENT" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "GZONE"."CLOSED_DAY"."CLOSED_IDX" IS '휴무번호';
   COMMENT ON COLUMN "GZONE"."CLOSED_DAY"."CLOSED_START_DATE" IS '휴무시작일';
   COMMENT ON COLUMN "GZONE"."CLOSED_DAY"."CLOSED_END_DATE" IS '휴무종료일';
   COMMENT ON COLUMN "GZONE"."CLOSED_DAY"."CLOSED_CONTENT" IS '휴무내용';
   COMMENT ON TABLE "GZONE"."CLOSED_DAY"  IS '휴무일 테이블';
