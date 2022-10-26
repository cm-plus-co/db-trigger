CREATE OR REPLACE FUNCTION public."custom_contancts_permissions_inquiry__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."inquiry__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."inquiry__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."siteclassification__c" = new."site_classification";
				trigger_row."datakind__c" = new."data_kind";
				trigger_row."inquirytype__c" = new."inquiry_type";
				-- trigger_row."inquirycompany__c" = new."InquiryCompany";
				trigger_row."contentofinquiry__c" = new."content_of_inquiry";
				trigger_row."companyname__c" = new."company_name";
				trigger_row."departmentname__c" = new."department_name";
				trigger_row."lastname__c" = new."name";
				trigger_row."firstname__c" = new."first_name";
				trigger_row."countryofresidence__c" = new."country_of_residence";
				trigger_row."mailadress__c" = new."mail_adress";
				trigger_row."tel__c" = new."tel";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."inquiry__c_id_seq"');

                INSERT INTO "salesforce"."inquiry__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."inquiry__c" set 
					siteclassification__c = new."site_classification",
					datakind__c = new."data_kind",
					inquirytype__c = new."inquiry_type",
					-- inquirycompany__c = new."InquiryCompany",
					contentofinquiry__c = new."content_of_inquiry",
					companyname__c = new."company_name",
					departmentname__c = new."department_name",
					lastname__c = new."name",
					firstname__c = new."first_name",
					countryofresidence__c = new."country_of_residence",
					mailadress__c = new."mail_adress",
					tel__c = new."tel"
				WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
