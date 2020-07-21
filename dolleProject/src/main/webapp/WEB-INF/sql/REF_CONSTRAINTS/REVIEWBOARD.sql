--------------------------------------------------------
--  Ref Constraints for Table REVIEWBOARD
--------------------------------------------------------

  ALTER TABLE "GZONE"."REVIEWBOARD" ADD CONSTRAINT "FK_COURSE_IDX" FOREIGN KEY ("COURSE_IDX")
	  REFERENCES "GZONE"."COURSE" ("COURSE_IDX") ENABLE;
