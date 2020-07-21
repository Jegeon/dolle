--------------------------------------------------------
--  Ref Constraints for Table NOTICEBOARD
--------------------------------------------------------

  ALTER TABLE "GZONE"."NOTICEBOARD" ADD CONSTRAINT "FK_MEMBER_IDX" FOREIGN KEY ("MEMBER_IDX")
	  REFERENCES "GZONE"."MEMBER" ("MEMBER_IDX") ENABLE;
