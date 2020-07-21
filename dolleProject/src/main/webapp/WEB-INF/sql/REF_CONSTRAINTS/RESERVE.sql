--------------------------------------------------------
--  Ref Constraints for Table RESERVE
--------------------------------------------------------

  ALTER TABLE "GZONE"."RESERVE" ADD CONSTRAINT "FK_TOUR_IDX" FOREIGN KEY ("TOUR_IDX")
	  REFERENCES "GZONE"."TOUR" ("TOUR_IDX") ENABLE;
