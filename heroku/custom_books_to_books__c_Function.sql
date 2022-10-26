CREATE OR REPLACE FUNCTION public."custom_books_to_books__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."books__c";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."books__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."title__c" = new."title";
				trigger_row."publishingcom__c" = new."publishing_com";
				trigger_row."author__c" = new."author";
				trigger_row."editiontype__c" = new."edition_type";
				-- trigger_row."productname__c" = new."ProductName";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."books__c_id_seq"');
			
                INSERT INTO "salesforce"."books__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."books__c" set 
						title__c = new."title",
						publishingcom__c = new."publishing_com",
						author__c = new."author",
						editiontype__c = new."edition_type",
						-- productname__c = new."ProductName"
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
