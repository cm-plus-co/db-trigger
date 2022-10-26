CREATE OR REPLACE FUNCTION salesforce."custom_attendancehistories_to_campaignmember_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "public"."attendance_histories";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "public"."attendance_histories" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."user_id" = new."userid__c";
				-- trigger_row."SeminarId" = new."seminarid__c";
				-- trigger_row."ELearningId" = new."elearningid__c";
				trigger_row."students_date" = new."studentsdate__c";
				trigger_row."company_name" = new."companyoraccount";
				trigger_row."department_name" = new."departmentname__c";
				trigger_row."name" = new."name__c";
				trigger_row."furigana" = new."furigana__c";
				trigger_row."postal_code" = new."postalcode";
				trigger_row."city_town_name" = new."citytownname__c";
				trigger_row."address_building_name" = new."addressbuildingname__c";
				trigger_row."tel" = new."phone";
				trigger_row."mail_adress" = new."email";
				trigger_row."content_of_inquiry" = new."contentofinquiry__c";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"public"."attendance_histories_id_seq"');

                INSERT INTO "public"."attendance_histories" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "public"."attendance_histories" set 
					"user_id" = new."userid__c",
					-- "SeminarId" = new."seminarid__c",
					-- "ELearningId" = new."elearningid__c",
					"students_date" = new."studentsdate__c",
					"company_name" = new."companyoraccount",
					"department_name" = new."departmentname__c",
					"name" = new."name__c",
					"furigana" = new."furigana__c",
					"postal_code" = new."postalcode",
					"city_town_name" = new."citytownname__c",
					"address_building_name" = new."addressbuildingname__c",
					"tel" = new."phone",
					"mail_adress" = new."email",
					"content_of_inquiry" = new."contentofinquiry__c"
				WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
