CREATE OR REPLACE FUNCTION public."custom_companyinfos_to_companyinfos__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."companyinfo__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."companyinfo__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."name" = new."company_name";
				/*trigger_row."languagetype__c" = new."language_type";*/
				trigger_row."maincontactmail__c" = new."main_contact_mail";
				trigger_row."maincontactmailen__c" = new."main_contact_mail_en";
				trigger_row."subcontactmail__c" = new."sub_contact_mail";
				trigger_row."subcontactmailen__c" = new."sub_contact_mail_en";
				/*trigger_row."publishstartdate__c" = new."publish_start_date";*/
				/*trigger_row."publishenddate__c" = new."publish_end_date";*/
				/*trigger_row."publicationapproval__c" = new."publication_approval";*/
				/*trigger_row."publicationapprovalen__c" = new."publication_approval_en";*/
				/*trigger_row."relationname__c" = new."relation_name";*/
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."companyinfo__c_id_seq"');
			
                INSERT INTO "salesforce"."companyinfo__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."companyinfo__c" set 
					name = new."company_name",
					/*languagetype__c = new."language_type",*/
					maincontactmail__c = new."main_contact_mail",
					maincontactmailen__c = new."main_contact_mail_en",
					subcontactmail__c = new."sub_contact_mail",
					subcontactmailen__c = new."sub_contact_mail_en"
					/*publishstartdate__c = new."publish_start_date",*/
					/*publishenddate__c = new."publish_end_date",*/
					/*publicationapproval__c = new."publication_approval",*/
					/*publicationapprovalen__c = new."publication_approval_en",*/
					/*relationname__c = new."relation_name"*/
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
