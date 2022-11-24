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
					UPDATE "public"."users-permissions_user" set id__c=new."id"
				else				
					trigger_row = ROW();
					trigger_row."ReceiveFreeEmailMagazine" = new."receivefreeemailmagazine__c";
					trigger_row."NewSendMail" = new."newsendmail__c";
					/*trigger_row."Industry" = new."industry__c";*/
					trigger_row."Company" = new."company__c";
					trigger_row."SiteInfomation" = new."siteinfomation__c";
					trigger_row."email" = new."email";
					trigger_row."FirstName" = new."firstname";
					-- trigger_row."LastName" = new."lastname";
					/*trigger_row."Type" = new."type__c";*/
					/*trigger_row."Title" = new."title__c";*/
					trigger_row."RequestLSMIPMail" = new."requestlsmipmail__c";
					trigger_row."LastNameAlphabet" = new."lastnamealphabet__c";
					trigger_row."RequestiVEXLMail" = new."requestivexlmail__c";
					trigger_row."LanguageType" = new."languagetype__c";
					trigger_row."FirstNameAlphabet" = new."firstnamealphabet__c";
					trigger_row."RegisterURL" = new."registerurl__c";
					trigger_row."RegisteredSite" = new."registeredsite__c";
					trigger_row."RegisteredStatus" = new."registeredstatus__c";
					trigger_row."ResetPasswordUrl" = new."resetpasswordurl__c";
					trigger_row."RequestGMPPMail" = new."requestgmppmail__c";
					trigger_row."LastNameKana" = new."furigana_last_name__c";
					trigger_row."EmailMagazineLanguage" = new."emailmagazinelanguage__c";
					trigger_row."CompanyKana" = new."companykana__c";
					trigger_row."FirstNameKana" = new."furigana_first_name__c";
					trigger_row."WithdrawalFlag" = new."withdrawalflag__c";
					trigger_row."PurchasingNumber" = new."purchasingnumber__c";
					trigger_row."OldUserID" = new."olduserid__c";
					trigger_row."HerokuConnect" = new."herokuconnect__c";
					trigger_row."WithdrawalDate" = new."withdrawaldate__c";
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
					"ReceiveFreeEmailMagazine" = new."receivefreeemailmagazine__c",
					"NewSendMail" = new."newsendmail__c",
					/*"Industry" = new."industry__c",*/
					"Company" = new."company__c",
					"SiteInfomation" = new."siteinfomation__c",
					"email" = new."email",
					"FirstName" = new."firstname",
					-- "LastName" = new."lastname",
					/*"Type" = new."type__c",*/
					/*"Title" = new."title__c",*/
					"RequestLSMIPMail" = new."requestlsmipmail__c",
					"LastNameAlphabet" = new."lastnamealphabet__c",
					"RequestiVEXLMail" = new."requestivexlmail__c",
					"LanguageType" = new."languagetype__c",
					"FirstNameAlphabet" = new."firstnamealphabet__c",
					"RegisterURL" = new."registerurl__c",
					"RegisteredSite" = new."registeredsite__c",
					"RegisteredStatus" = new."registeredstatus__c",
					"ResetPasswordUrl" = new."resetpasswordurl__c",
					"RequestGMPPMail" = new."requestgmppmail__c",
					"LastNameKana" = new."furigana_last_name__c",
					"EmailMagazineLanguage" = new."emailmagazinelanguage__c",
					"CompanyKana" = new."companykana__c",
					"FirstNameKana" = new."furigana_first_name__c",
					"WithdrawalFlag" = new."withdrawalflag__c",
					"PurchasingNumber" = new."purchasingnumber__c",
					"OldUserID" = new."olduserid__c",
					"HerokuConnect" = new."herokuconnect__c",
					"WithdrawalDate" = new."withdrawaldate__c",
					"gmppTagRank1st" = new."gmpptagrank1st__c",
					"gmppTagRank2nd" = new."gmpptagrank2nd__c",
					"gmppTagRank3th" = new."gmpptagrank3th__c",
					"lsmipTagRank1st" = new."lsmiptagrank1st__c",
					"lsmipTagRank2nd" = new."lsmiptagrank2nd__c",
					"lsmipTagRank3th" = new."lsmiptagrank3th__c"
				/*WHERE id__c = Text(new."id");*/
				WHERE TEXT(id) = new."id__c"
					and (
						(("ReceiveFreeEmailMagazine" != new."receivefreeemailmagazine__c") or ("ReceiveFreeEmailMagazine" is null and new."receivefreeemailmagazine__c" is not null)) or
						(("NewSendMail" != new."newsendmail__c") or ("NewSendMail" is null and new."newsendmail__c" is not null)) or
						(("Company" != new."company__c") or ("Company" is null and new."company__c" is not null)) or
						(("SiteInfomation" != new."siteinfomation__c") or ("SiteInfomation" is null and new."siteinfomation__c" is not null)) or
						(("email" != new."email") or ("email" is null and new."email" is not null)) or
						(("FirstName" != new."firstname") or ("FirstName" is null and new."firstname" is not null)) or
						-- (("LastName" != new."lastname" and new."lastname" is not null) or ("LastName" is null and new."lastname" is not null)) or
						(("RequestLSMIPMail" != new."requestlsmipmail__c") or ("RequestLSMIPMail" is null and new."requestlsmipmail__c" is not null)) or
						(("LastNameAlphabet" != new."lastnamealphabet__c") or ("LastNameAlphabet" is null and new."lastnamealphabet__c" is not null)) or
						(("RequestiVEXLMail" != new."requestivexlmail__c") or ("RequestiVEXLMail" is null and new."requestivexlmail__c" is not null)) or
						(("LanguageType" != new."languagetype__c") or ("LanguageType" is null and new."languagetype__c" is not null)) or
						(("FirstNameAlphabet" != new."firstnamealphabet__c") or ("FirstNameAlphabet" is null and new."firstnamealphabet__c" is not null)) or
						(("RegisterURL" != new."registerurl__c") or ("RegisterURL" is null and new."registerurl__c" is not null)) or
						(("RegisteredSite" != new."registeredsite__c") or ("RegisteredSite" is null and new."registeredsite__c" is not null)) or
						(("RegisteredStatus" != new."registeredstatus__c") or ("RegisteredStatus" is null and new."registeredstatus__c" is not null)) or
						(("ResetPasswordUrl" != new."resetpasswordurl__c") or ("ResetPasswordUrl" is null and new."resetpasswordurl__c" is not null)) or
						(("RequestGMPPMail" != new."requestgmppmail__c") or ("RequestGMPPMail" is null and new."requestgmppmail__c" is not null)) or
						(("LastNameKana" != new."furigana_last_name__c") or ("LastNameKana" is null and new."furigana_last_name__c" is not null)) or
						(("EmailMagazineLanguage" != new."emailmagazinelanguage__c") or ("EmailMagazineLanguage" is null and new."emailmagazinelanguage__c" is not null)) or
						(("CompanyKana" != new."companykana__c") or ("CompanyKana" is null and new."companykana__c" is not null)) or
						(("FirstNameKana" != new."furigana_first_name__c") or ("FirstNameKana" is null and new."furigana_first_name__c" is not null)) or
						(("WithdrawalFlag" != new."withdrawalflag__c") or ("WithdrawalFlag" is null and new."withdrawalflag__c" is not null)) or
						(("PurchasingNumber" != new."purchasingnumber__c") or ("PurchasingNumber" is null and new."purchasingnumber__c" is not null)) or
						(("OldUserID" != new."olduserid__c") or ("OldUserID" is null and new."olduserid__c" is not null)) or
						(("HerokuConnect" != new."herokuconnect__c") or ("HerokuConnect" is null and new."herokuconnect__c" is not null)) or 
						(("WithdrawalDate" != new."withdrawaldate__c") or ("WithdrawalDate" is null and new."withdrawaldate__c" is not null)) or
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
$function$;