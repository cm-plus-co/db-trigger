CREATE OR REPLACE FUNCTION public."custom_billinghistorys_to_billinghistorys__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."billinghistory__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."billinghistory__c" WHERE id__c = Text(old.id);
            ELSEIF  (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."userid__c" = new."user_id";
				-- trigger_row."companyid__c" = new."CompanyId";
				trigger_row."productcategory__c" = new."product_category";
				trigger_row."billingdatetime__c" = new."billing_date_time";
				trigger_row."billingamount__c" = new."billing_amount";
				trigger_row."languagetype__c" = new."language_type";
				trigger_row."kind__c" = new."kind";
				trigger_row."id__c" = new."id";
				trigger_row."name" = 'Heroku連携';
				trigger_row."id" = nextval('"salesforce"."billinghistory__c_id_seq"');

                INSERT INTO "salesforce"."billinghistory__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."billinghistory__c" set 
					userid__c = new."user_id",
					-- companyid__c = new."CompanyId",
					productcategory__c = new."product_category",
					billingdatetime__c = new."billing_date_time",
					billingamount__c = new."billing_amount",
					languagetype__c = new."language_type",
					kind__c = new."kind"
				WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
