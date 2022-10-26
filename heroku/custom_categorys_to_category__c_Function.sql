CREATE OR REPLACE FUNCTION public."custom_categorys_to_category__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."category__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."category__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."siteclassification__c" = new."site_classification";
				trigger_row."name" = new."category_name";
				trigger_row."categorynameen__c" = new."category_name_en";
				-- trigger_row."parentcategoryid__c" = new."ParentCategoryId";
				trigger_row."relationname__c" = new."relation_name";
				-- trigger_row."tagmaster__c" = new."TagMaster";
				/*trigger_row."tagmastersrnmenu__c" = new."TagMasterSrnMenu";*/
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."category__c_id_seq"');
			
                INSERT INTO "salesforce"."category__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."category__c" set 
					siteclassification__c = new."site_classification",
					name = new."CategoryName",
					categorynameen__c = new."category_name_en",
					-- parentcategoryid__c = new."ParentCategoryId",
					relationname__c = new."relation_name",
					-- tagmaster__c = new."TagMaster"
					/*tagmastersrnmenu__c = new."TagMasterSrnMenu"*/
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
