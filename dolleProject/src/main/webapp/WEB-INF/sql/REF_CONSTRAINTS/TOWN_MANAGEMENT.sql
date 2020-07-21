--------------------------------------------------------
--  Ref Constraints for Table TOWN_MANAGEMENT
--------------------------------------------------------

  ALTER TABLE "GZONE"."TOWN_MANAGEMENT" ADD CONSTRAINT "FK_TOWN_IDX" FOREIGN KEY ("TOWN_IDX")
	  REFERENCES "GZONE"."TOWN" ("TOWN_IDX") ENABLE;
