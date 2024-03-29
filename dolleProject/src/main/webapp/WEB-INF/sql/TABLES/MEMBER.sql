--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "GZONE"."MEMBER" 
   (	"MEMBER_IDX" NUMBER, 
	"MEMBER_NAME" VARCHAR2(30 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(40 BYTE), 
	"MEMBER_NICKNAME" VARCHAR2(20 BYTE), 
	"MEMBER_PASSWORD" VARCHAR2(30 BYTE), 
	"MEMBER_PHONE" VARCHAR2(15 BYTE), 
	"MEMBER_BIRTHDATE" DATE DEFAULT SYSDATE, 
	"MEMBER_NATIONAL" VARCHAR2(15 BYTE) DEFAULT 'domestic', 
	"MEMBER_CRE_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_MOD_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_GRADE" VARCHAR2(10 BYTE) DEFAULT 'user', 
	"MEMBER_DEL_YN" VARCHAR2(5 BYTE) DEFAULT 'n', 
	"MEMBER_TEMP_PWD" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
