CREATE OR REPLACE FUNCTION public."custom_areaofinterests_to_areaofinterest__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."areaofinterest__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."areaofinterest__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."siteclassification__c" = new."site_classification";
				trigger_row."displaylanguage__c" = new."display_language";
				trigger_row."userid__c" = new."user_id";
				-- trigger_row."categoryid__c" = new."CategoryId";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."areaofinterest__c_id_seq"');

                INSERT INTO "salesforce"."areaofinterest__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."areaofinterest__c" set 
					siteclassification__c = new."site_classification",
					displaylanguage__c = new."display_language",
					userid__c = new."user_id",
					-- categoryid__c = new."CategoryId"
				WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
