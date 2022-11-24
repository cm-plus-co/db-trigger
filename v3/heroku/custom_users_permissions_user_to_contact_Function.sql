-- FUNCTION: public.custom_users_permissions_user_to_contact_Function()

-- DROP FUNCTION IF EXISTS public."custom_users_permissions_user_to_contact_Function"();

CREATE OR REPLACE FUNCTION public."custom_users_permissions_user_to_contact_Function"()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
			trigger_row "salesforce"."contact";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."contact" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				if exists(select 1 from "salesforce"."contact" where (id__c is null or id__c = '') and (email=new."email" or email_temp__c = new."email_temp")) then
					UPDATE "salesforce"."contact" set 
						id__c=new."id",
						receivefreeemailmagazine__c = new."ReceiveFreeEmailMagazine",
						newsendmail__c = new."NewSendMail",
						industry__c = new."Industry",
						company__c = new."Company",
						siteinfomation__c = new."SiteInfomation",
						email = new."email",
						email_temp__c = new."email_temp",
						firstname = new."FirstName",
						lastname = coalesce(new."LastName", new."email"),
						type__c = new."Type",
						title__c = new."Title",
						requestlsmipmail__c = new."RequestLSMIPMail",
						lastnamealphabet__c = new."LastNameAlphabet",
						requestivexlmail__c = new."RequestiVEXLMail",
						languagetype__c = new."LanguageType",
						firstnamealphabet__c = new."FirstNameAlphabet",
						registerurl__c = new."RegisterURL",
						registeredsite__c = new."RegisteredSite",
						registeredstatus__c = new."RegisteredStatus",
						resetpasswordurl__c = new."ResetPasswordUrl",
						resetpassword__c = new."ResetPassword",
						resetpassworddatetime__c = new."ResetPasswordDateTime",
						memberrequestdatetime__c = new."MemberRequestDatetime",
						requestgmppmail__c = new."RequestGMPPMail",
						furigana_last_name__c = new."LastNameKana",
						emailmagazinelanguage__c = new."EmailMagazineLanguage",
						companykana__c = new."CompanyKana",
						furigana_first_name__c = new."FirstNameKana",
						withdrawalflag__c = new."WithdrawalFlag",
						purchasingnumber__c = new."PurchasingNumber",
						olduserid__c = new."OldUserID",
						herokuconnect__c = new."HerokuConnect",
						withdrawaldate__c = new."WithdrawalDate",
						"gmpptagrank1st__c" = new."gmppTagRank1st",
						"gmpptagrank2nd__c" = new."gmppTagRank2nd",
						"gmpptagrank3th__c" = new."gmppTagRank3th",
						"lsmiptagrank1st__c" = new."lsmipTagRank1st",
						"lsmiptagrank2nd__c" = new."lsmipTagRank2nd",
						"lsmiptagrank3th__c" = new."lsmipTagRank3th"
					where (id__c is null or id__c = '') and (email=new."email" or email_temp__c = new."email_temp");
				else
					trigger_row = ROW();
					trigger_row."receivefreeemailmagazine__c" = new."ReceiveFreeEmailMagazine";
					trigger_row."newsendmail__c" = new."NewSendMail";
					trigger_row."industry__c" = new."Industry";
					trigger_row."company__c" = new."Company";
					trigger_row."siteinfomation__c" = new."SiteInfomation";
					--trigger_row."email" = new."email"; 
					trigger_row."email_temp__c" = new."email_temp";
					trigger_row."firstname" = new."FirstName";
					trigger_row."lastname" = new."email";
					trigger_row."type__c" = new."Type";
					trigger_row."title__c" = new."Title";
					trigger_row."requestlsmipmail__c" = new."RequestLSMIPMail";
					trigger_row."lastnamealphabet__c" = new."LastNameAlphabet";
					trigger_row."requestivexlmail__c" = new."RequestiVEXLMail";
					trigger_row."languagetype__c" = new."LanguageType";
					trigger_row."firstnamealphabet__c" = new."FirstNameAlphabet";
					trigger_row."registerurl__c" = new."RegisterURL";
					trigger_row."registeredsite__c" = new."RegisteredSite";
					trigger_row."registeredstatus__c" = new."RegisteredStatus";
					trigger_row."resetpasswordurl__c" = new."ResetPasswordUrl";
					trigger_row."resetpassword__c" = new."ResetPassword";
					trigger_row."requestgmppmail__c" = new."RequestGMPPMail";
					trigger_row."furigana_last_name__c" = new."LastNameKana";
					trigger_row."emailmagazinelanguage__c" = new."EmailMagazineLanguage";
					trigger_row."companykana__c" = new."CompanyKana";
					trigger_row."furigana_first_name__c" = new."FirstNameKana";
					trigger_row."withdrawalflag__c" = new."WithdrawalFlag";
					trigger_row."purchasingnumber__c" = new."PurchasingNumber";
					trigger_row."olduserid__c" = new."OldUserID";
					trigger_row."herokuconnect__c" = new."HerokuConnect";
					trigger_row."withdrawaldate__c" = new."WithdrawalDate";
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
					receivefreeemailmagazine__c = new."ReceiveFreeEmailMagazine",
					newsendmail__c = new."NewSendMail",
					industry__c = new."Industry",
					company__c = new."Company",
					siteinfomation__c = new."SiteInfomation",
					email = new."email",
					email_temp__c = new."email_temp",
					firstname = new."FirstName",
					lastname = coalesce(new."LastName", new."email"),
					type__c = new."Type",
					title__c = new."Title",
					requestlsmipmail__c = new."RequestLSMIPMail",
					lastnamealphabet__c = new."LastNameAlphabet",
					requestivexlmail__c = new."RequestiVEXLMail",
					languagetype__c = new."LanguageType",
					firstnamealphabet__c = new."FirstNameAlphabet",
					registerurl__c = new."RegisterURL",
					registeredsite__c = new."RegisteredSite",
					registeredstatus__c = new."RegisteredStatus",
					resetpasswordurl__c = new."ResetPasswordUrl",
					resetpassword__c = new."ResetPassword",
					resetpassworddatetime__c = new."ResetPasswordDateTime",
					memberrequestdatetime__c = new."MemberRequestDatetime",
					requestgmppmail__c = new."RequestGMPPMail",
					furigana_last_name__c = new."LastNameKana",
					emailmagazinelanguage__c = new."EmailMagazineLanguage",
					companykana__c = new."CompanyKana",
					furigana_first_name__c = new."FirstNameKana",
					withdrawalflag__c = new."WithdrawalFlag",
					purchasingnumber__c = new."PurchasingNumber",
					olduserid__c = new."OldUserID",
					herokuconnect__c = new."HerokuConnect",
					withdrawaldate__c = new."WithdrawalDate",
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
$BODY$;

ALTER FUNCTION public."custom_users_permissions_user_to_contact_Function"()
    OWNER TO postgres;
