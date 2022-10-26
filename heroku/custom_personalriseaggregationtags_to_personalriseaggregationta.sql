CREATE OR REPLACE FUNCTION public.custom_personalriseaggregationtags_to_personalriseaggregationta()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."personalriseaggregationtag__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."personalriseaggregationtag__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."userid__c" = new."user_id";
				-- trigger_row."tagmasterid__c" = new."TagMasterId";
				/*trigger_row."siteclassification__c" = new."SiteClassification";*/
				trigger_row."viewpoint__c" = new."view_point";
				trigger_row."totalpoints__c" = new."total_points";
				trigger_row."lastviewmonth__c" = new."last_view_month";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."personalriseaggregationtag__c_id_seq"');
			
                INSERT INTO "salesforce"."personalriseaggregationtag__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."personalriseaggregationtag__c" set 
					userid__c = new."user_id",
					-- tagmasterid__c = new."TagMasterId",
					/*siteClassification__c = new."SiteClassification",*/
					viewpoint__c = new."view_point",
					totalpoints__c = new."total_points",
					lastviewmonth__c = new."last_view_month"
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
