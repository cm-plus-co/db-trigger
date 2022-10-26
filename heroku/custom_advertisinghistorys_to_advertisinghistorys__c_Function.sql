CREATE OR REPLACE FUNCTION public."custom_advertisinghistorys_to_advertisinghistorys__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."advertisinghistory__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."advertisinghistory__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."userid__c" = new."user_id";
				trigger_row."siteclassification__c" = new."site_classification";
				-- trigger_row."advertisingurl__c" = new."AdvertisingUrl";
				trigger_row."selectionscount__c" = new."selections_count";
				trigger_row."selectionslastdatetime__c" = new."selections_last_datetime";
				trigger_row."displaycount__c" = new."display_count";
				trigger_row."displaylastdatetime__c" = new."display_last_datetime";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."advertisinghistory__c_id_seq"');

                INSERT INTO "salesforce"."advertisinghistory__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."advertisinghistory__c" set 
					userid__c = new."user_id",
					siteclassification__c = new."site_classification",
					-- advertisingurl__c = new."AdvertisingUrl",
					selectionscount__c = new."selections_count",
					selectionslastdatetime__c = new."selections_last_datetime",
					displaycount__c = new."display_count",
					displaylastdatetime__c = new."display_last_datetime"
				WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
