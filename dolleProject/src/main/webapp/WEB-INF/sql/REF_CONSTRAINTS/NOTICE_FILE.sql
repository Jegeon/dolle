--------------------------------------------------------
--  Ref Constraints for Table NOTICE_FILE
--------------------------------------------------------

  ALTER TABLE "GZONE"."NOTICE_FILE" ADD CONSTRAINT "FK_NOTICE_IDX" FOREIGN KEY ("NOTICE_IDX")
	  REFERENCES "GZONE"."NOTICEBOARD" ("NOTICE_IDX") ENABLE;
