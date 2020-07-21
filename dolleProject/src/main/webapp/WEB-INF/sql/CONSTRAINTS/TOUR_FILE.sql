--------------------------------------------------------
--  Constraints for Table TOUR_FILE
--------------------------------------------------------

  ALTER TABLE "GZONE"."TOUR_FILE" ADD CONSTRAINT "PK_TOUR_FILE_IDX" PRIMARY KEY ("TOUR_FILE_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GZONE"."TOUR_FILE" MODIFY ("TOUR_STORED_FILE_NAME" NOT NULL ENABLE);
  ALTER TABLE "GZONE"."TOUR_FILE" MODIFY ("TOUR_ORIGINAL_FILE_NAME" NOT NULL ENABLE);
  ALTER TABLE "GZONE"."TOUR_FILE" MODIFY ("TOUR_IDX" NOT NULL ENABLE);
  ALTER TABLE "GZONE"."TOUR_FILE" MODIFY ("TOUR_FILE_IDX" NOT NULL ENABLE);
