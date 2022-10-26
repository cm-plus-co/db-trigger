CREATE OR REPLACE FUNCTION salesforce."custom_users_permissions_user_to_contact_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "public"."users-permissions_user";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "public"."users-permissions_user" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				if exists(select 1 from "public"."users-permissions_user" where (id__c is null or id__c = '')  and email=new."email") then
					UPDATE "public"."users-permissions_user" set id__c=new."id" WHERE (id__c is null or id__c = '') and email=new."email";
				else				
					trigger_row = ROW();
					trigger_row."receive_free_email_magazine" = new."receivefreeemailmagazine__c";
					trigger_row."new_send_mail" = new."newsendmail__c";
					/*trigger_row."Industry" = new."industry__c";*/
					trigger_row."company" = new."company__c";
					trigger_row."site_infomation" = new."siteinfomation__c";
					trigger_row."email" = new."email";
					trigger_row."first_name" = new."firstname";
					-- trigger_row."LastName" = new."lastname";
					/*trigger_row."Type" = new."type__c";*/
					/*trigger_row."Title" = new."title__c";*/
					trigger_row."request_lsmip_mail" = new."requestlsmipmail__c";
					trigger_row."last_name_alphabet" = new."lastnamealphabet__c";
					trigger_row."requesti_vexl_mail" = new."requestivexlmail__c";
					trigger_row."language_type" = new."languagetype__c";
					trigger_row."first_name_alphabet" = new."firstnamealphabet__c";
					trigger_row."register_url" = new."registerurl__c";
					trigger_row."registered_site" = new."registeredsite__c";
					trigger_row."registered_status" = new."registeredstatus__c";
					trigger_row."reset_password_url" = new."resetpasswordurl__c";
					trigger_row."request_gmpp_mail" = new."requestgmppmail__c";
					trigger_row."last_name_kana" = new."furigana_last_name__c";
					trigger_row."email_magazine_language" = new."emailmagazinelanguage__c";
					trigger_row."company_kana" = new."companykana__c";
					trigger_row."first_name_kana" = new."furigana_first_name__c";
					trigger_row."withdrawal_flag" = new."withdrawalflag__c";
					trigger_row."purchasing_number" = new."purchasingnumber__c";
					trigger_row."old_user_id" = new."olduserid__c";
					trigger_row."heroku_connect" = new."herokuconnect__c";
					trigger_row."withdrawal_date" = new."withdrawaldate__c";
					trigger_row."gmppTagRank1st" = new."gmpptagrank1st__c";
					trigger_row."gmppTagRank2nd" = new."gmpptagrank2nd__c";
					trigger_row."gmppTagRank3th" = new."gmpptagrank3th__c";
					trigger_row."lsmipTagRank1st" = new."lsmiptagrank1st__c";
					trigger_row."lsmipTagRank2nd" = new."lsmiptagrank2nd__c";
					trigger_row."lsmipTagRank3th" = new."lsmiptagrank3th__c";
					trigger_row."id__c" = new."id";
					trigger_row."id" = nextval('"public"."users-permissions_user_id_seq"');

					INSERT INTO "public"."users-permissions_user" VALUES (trigger_row.*);
				end if;
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "public"."users-permissions_user" set 
					"Receive_free_email_magazine" = new."receivefreeemailmagazine__c",
					"new_send_mail" = new."newsendmail__c",
					/*"Industry" = new."industry__c",*/
					"Company" = new."company__c",
					"site_infomation" = new."siteinfomation__c",
					"email" = new."email",
					"first_name" = new."firstname",
					-- "LastName" = new."lastname",
					/*"Type" = new."type__c",*/
					/*"Title" = new."title__c",*/
					"Request_lsmip_mail" = new."requestlsmipmail__c",
					"last_name_alphabet" = new."lastnamealphabet__c",
					"requesti_vexl_mail" = new."requestivexlmail__c",
					"language_type" = new."languagetype__c",
					"first_name_alphabet" = new."firstnamealphabet__c",
					"register_url" = new."registerurl__c",
					"registered_site" = new."registeredsite__c",
					"registered_status" = new."registeredstatus__c",
					"reset_password_url" = new."resetpasswordurl__c",
					"request_gmpp_mail" = new."requestgmppmail__c",
					"last_name_kana" = new."furigana_last_name__c",
					"email_magazine_language" = new."emailmagazinelanguage__c",
					"company_kana" = new."companykana__c",
					"first_name_kana" = new."furigana_first_name__c",
					"withdrawal_flag" = new."withdrawalflag__c",
					"purchasing_number" = new."purchasingnumber__c",
					"old_user_id" = new."olduserid__c",
					"heroku_connect" = new."herokuconnect__c",
					"withdrawal_date" = new."withdrawaldate__c",
					"gmppTagRank1st" = new."gmpptagrank1st__c",
					"gmppTagRank2nd" = new."gmpptagrank2nd__c",
					"gmppTagRank3th" = new."gmpptagrank3th__c",
					"lsmipTagRank1st" = new."lsmiptagrank1st__c",
					"lsmipTagRank2nd" = new."lsmiptagrank2nd__c",
					"lsmipTagRank3th" = new."lsmiptagrank3th__c"
				/*WHERE id__c = Text(new."id");*/
				WHERE TEXT(id) = new."id__c"
					and (
						(("receive_free_email_magazine" != new."receivefreeemailmagazine__c") or ("receive_free_email_magazine" is null and new."receivefreeemailmagazine__c" is not null)) or
						(("new_send_mail" != new."newsendmail__c") or ("new_send_mail" is null and new."newsendmail__c" is not null)) or
						(("company" != new."company__c") or ("company" is null and new."company__c" is not null)) or
						(("site_infomation" != new."siteinfomation__c") or ("site_infomation" is null and new."siteinfomation__c" is not null)) or
						(("email" != new."email") or ("email" is null and new."email" is not null)) or
						(("first_name" != new."firstname") or ("first_name" is null and new."firstname" is not null)) or
						-- (("LastName" != new."lastname" and new."lastname" is not null) or ("LastName" is null and new."lastname" is not null)) or
						(("request_lsmip_mail" != new."requestlsmipmail__c") or ("request_lsmip_mail" is null and new."requestlsmipmail__c" is not null)) or
						(("last_name_alphabet" != new."lastnamealphabet__c") or ("last_name_alphabet" is null and new."lastnamealphabet__c" is not null)) or
						(("requesti_vexl_mail" != new."requestivexlmail__c") or ("requesti_vexl_mail" is null and new."requestivexlmail__c" is not null)) or
						(("language_type" != new."languagetype__c") or ("language_type" is null and new."languagetype__c" is not null)) or
						(("first_name_alphabet" != new."firstnamealphabet__c") or ("first_name_alphabet" is null and new."firstnamealphabet__c" is not null)) or
						(("register_url" != new."registerurl__c") or ("register_url" is null and new."registerurl__c" is not null)) or
						(("registered_site" != new."registeredsite__c") or ("registered_site" is null and new."registeredsite__c" is not null)) or
						(("registered_status" != new."registeredstatus__c") or ("registered_status" is null and new."registeredstatus__c" is not null)) or
						(("reset_password_url" != new."resetpasswordurl__c") or ("reset_password_url" is null and new."resetpasswordurl__c" is not null)) or
						(("request_gmpp_mail" != new."requestgmppmail__c") or ("request_gmpp_mail" is null and new."requestgmppmail__c" is not null)) or
						(("last_name_kana" != new."furigana_last_name__c") or ("last_name_kana" is null and new."furigana_last_name__c" is not null)) or
						(("email_magazine_language" != new."emailmagazinelanguage__c") or ("email_magazine_language" is null and new."emailmagazinelanguage__c" is not null)) or
						(("company_kana" != new."companykana__c") or ("company_kana" is null and new."companykana__c" is not null)) or
						(("first_name_kana" != new."furigana_first_name__c") or ("first_name_kana" is null and new."furigana_first_name__c" is not null)) or
						(("withdrawal_flag" != new."withdrawalflag__c") or ("withdrawal_flag" is null and new."withdrawalflag__c" is not null)) or
						(("purchasing_number" != new."purchasingnumber__c") or ("purchasing_number" is null and new."purchasingnumber__c" is not null)) or
						(("old_user_id" != new."olduserid__c") or ("old_user_id" is null and new."olduserid__c" is not null)) or
						(("heroku_connect" != new."herokuconnect__c") or ("heroku_connect" is null and new."herokuconnect__c" is not null)) or 
						(("withdrawal_date" != new."withdrawaldate__c") or ("withdrawal_date" is null and new."withdrawaldate__c" is not null)) or
						(("gmppTagRank1st" != new."gmpptagrank1st__c") or ("gmppTagRank1st" is null and new."gmpptagrank1st__c" is not null)) or
						(("gmppTagRank2nd" != new."gmpptagrank2nd__c") or ("gmppTagRank2nd" is null and new."gmpptagrank2nd__c" is not null)) or
						(("gmppTagRank3th" != new."gmpptagrank3th__c") or ("gmppTagRank3th" is null and new."gmpptagrank3th__c" is not null)) or
						(("lsmipTagRank1st" != new."lsmiptagrank1st__c") or ("lsmipTagRank1st" is null and new."lsmiptagrank1st__c" is not null)) or
						(("lsmipTagRank2nd" != new."lsmiptagrank2nd__c") or ("lsmipTagRank2nd" is null and new."lsmiptagrank2nd__c" is not null)) or
						(("lsmipTagRank3th" != new."lsmiptagrank3th__c") or ("lsmipTagRank3th" is null and new."lsmiptagrank3th__c" is not null))
					);
            END IF;

            RETURN NULL;
        END;
$function$
;
