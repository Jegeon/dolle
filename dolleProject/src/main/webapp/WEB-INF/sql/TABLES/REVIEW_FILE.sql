--------------------------------------------------------
--  DDL for Table REVIEW_FILE
--------------------------------------------------------

  CREATE TABLE "GZONE"."REVIEW_FILE" 
   (	"REVIEW_FILE_IDX" NUMBER, 
	"REVIEW_IDX" NUMBER, 
	"REVIEW_ORIGINAL_FILE_NAME" VARCHAR2(300 BYTE), 
	"REVIEW_STORED_FILE_NAME" VARCHAR2(300 BYTE), 
	"REVIEW_FILE_SIZE" NUMBER, 
	"REVIEW_FILE_CRE_DATE" DATE DEFAULT SYSDATE, 
	"REVIEW_FILE_MOD_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;