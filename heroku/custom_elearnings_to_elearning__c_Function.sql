CREATE OR REPLACE FUNCTION public."custom_elearnings_to_elearning__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."elearning__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."elearning__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."elearningkind__c" = new."e_learning_kind";
				trigger_row."title__c" = new."title";
				trigger_row."courseperiod__c" = new."course_period";
				trigger_row."numberofthemes__c" = new."number_of_themes";
				trigger_row."tuitionfee__c" = new."tuition_fee";
				-- trigger_row."productname__c" = new."ProductName";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."elearning__c_id_seq"');
			
                INSERT INTO "salesforce"."elearning__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."elearning__c" set 
						elearningkind__c = new."e_learning_kind",
						title__c = new."title",
						courseperiod__c = new."course_period",
						numberofthemes__c = new."number_of_themes",
						tuitionfee__c = new."tuition_fee",
						-- productname__c = new."ProductName"
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
