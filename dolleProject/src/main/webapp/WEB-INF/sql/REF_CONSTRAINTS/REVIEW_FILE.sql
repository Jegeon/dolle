--------------------------------------------------------
--  Ref Constraints for Table REVIEW_FILE
--------------------------------------------------------

  ALTER TABLE "GZONE"."REVIEW_FILE" ADD CONSTRAINT "FK_REVIEW_IDX" FOREIGN KEY ("REVIEW_IDX")
	  REFERENCES "GZONE"."REVIEWBOARD" ("REVIEW_IDX") ENABLE;
