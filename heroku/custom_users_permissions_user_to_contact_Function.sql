CREATE OR REPLACE FUNCTION public."custom_users_permissions_user_to_contact_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."contact";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."contact" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				if exists(select 1 from "salesforce"."contact" where (id__c is null or id__c = '') and email=new."email") then
					UPDATE "salesforce"."contact" set id__c=new."id" where (id__c is null or id__c = '') and email=new."email";
				else
					trigger_row = ROW();
					trigger_row."receivefreeemailmagazine__c" = new."receive_free_email_magazine";
					trigger_row."newsendmail__c" = new."new_send_mail";
					-- trigger_row."industry__c" = new."Industry";
					trigger_row."company__c" = new."company";
					trigger_row."siteinfomation__c" = new."site_infomation";
					trigger_row."email" = new."email"; 
					trigger_row."firstname" = new."first_name";
					trigger_row."lastname" = new."email";
					-- trigger_row."type__c" = new."Type";
					-- trigger_row."title__c" = new."Title";
					trigger_row."requestlsmipmail__c" = new."request_lsmip_mail";
					trigger_row."lastnamealphabet__c" = new."last_name_alphabet";
					trigger_row."requestivexlmail__c" = new."requesti_vexl_mail";
					trigger_row."languagetype__c" = new."language_type";
					trigger_row."firstnamealphabet__c" = new."first_name_alphabet";
					trigger_row."registerurl__c" = new."register_url";
					trigger_row."registeredsite__c" = new."registered_site";
					trigger_row."registeredstatus__c" = new."registered_status";
					trigger_row."resetpasswordurl__c" = new."reset_password_url";
					trigger_row."resetpassword__c" = new."reset_password";
					trigger_row."requestgmppmail__c" = new."request_gmpp_mail";
					trigger_row."furigana_last_name__c" = new."last_name_kana";
					trigger_row."emailmagazinelanguage__c" = new."email_magazine_language";
					trigger_row."companykana__c" = new."company_kana";
					trigger_row."furigana_first_name__c" = new."first_name_kana";
					trigger_row."withdrawalflag__c" = new."withdrawal_flag";
					trigger_row."purchasingnumber__c" = new."purchasing_number";
					trigger_row."olduserid__c" = new."old_user_id";
					trigger_row."herokuconnect__c" = new."heroku_connect";
					trigger_row."withdrawaldate__c" = new."withdrawal_date";
					trigger_row."gmpptagrank1st__c" = new."gmppTagRank1st";
					trigger_row."gmpptagrank2nd__c" = new."gmppTagRank2nd";
					trigger_row."gmpptagrank3th__c" = new."gmppTagRank3th";
					trigger_row."lsmiptagrank1st__c" = new."lsmipTagRank1st";
					trigger_row."lsmiptagrank2nd__c" = new."lsmipTagRank2nd";
					trigger_row."lsmiptagrank3th__c" = new."lsmipTagRank3th";
					trigger_row."id__c" = new."id";
					trigger_row."id" = nextval('"salesforce"."contact_id_seq"');
                	INSERT INTO "salesforce"."contact" VALUES (trigger_row.*);
				end if;
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."contact" set 
					receivefreeemailmagazine__c = new."receive_free_email_magazine",
					newsendmail__c = new."new_send_mail",
					-- industry__c = new."Industry",
					company__c = new."company",
					siteinfomation__c = new."site_infomation",
					email = new."email",
					firstname = new."first_name",
					lastname = coalesce(new."last_name", new."email"),
					-- type__c = new."Type",
					-- title__c = new."Title",
					requestlsmipmail__c = new."request_lsmip_mail",
					lastnamealphabet__c = new."last_name_alphabet",
					requestivexlmail__c = new."requesti_vexl_mail",
					languagetype__c = new."language_type",
					firstnamealphabet__c = new."first_name_alphabet",
					registerurl__c = new."register_url",
					registeredsite__c = new."registered_site",
					registeredstatus__c = new."registered_status",
					resetpasswordurl__c = new."reset_password_url",
					resetpassword__c = new."reset_password",
					resetpassworddatetime__c = new."reset_password_date_time",
					memberrequestdatetime__c = new."member_request_datetime",
					requestgmppmail__c = new."request_gmpp_mail",
					furigana_last_name__c = new."last_name_kana",
					emailmagazinelanguage__c = new."email_magazine_language",
					companykana__c = new."company_kana",
					furigana_first_name__c = new."first_name_kana",
					withdrawalflag__c = new."withdrawal_flag",
					purchasingnumber__c = new."purchasing_number",
					olduserid__c = new."old_user_id",
					herokuconnect__c = new."heroku_connect",
					withdrawaldate__c = new."withdrawal_date",
					"gmpptagrank1st__c" = new."gmppTagRank1st",
					"gmpptagrank2nd__c" = new."gmppTagRank2nd",
					"gmpptagrank3th__c" = new."gmppTagRank3th",
					"lsmiptagrank1st__c" = new."lsmipTagRank1st",
					"lsmiptagrank2nd__c" = new."lsmipTagRank2nd",
					"lsmiptagrank3th__c" = new."lsmipTagRank3th"
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
