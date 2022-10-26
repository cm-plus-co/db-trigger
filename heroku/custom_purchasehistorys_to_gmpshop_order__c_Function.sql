CREATE OR REPLACE FUNCTION public."custom_purchasehistorys_to_gmpshop_order__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."gmpshop_order__c";
        BEGIN
            
            IF (TG_OP = 'DELETE' AND old."invoice_address" !~~ 'LSMIP%') THEN
                DELETE FROM "salesforce"."gmpshop_order__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT' AND new."invoice_address" !~~ 'LSMIP%') THEN
				trigger_row = ROW();
				-- trigger_row."userid__c" = new."UserId";
				trigger_row."seminarpurchase__c" = new."seminar";
				trigger_row."displaylanguage__c" = new."display_language";
				trigger_row."purchasedate__c" = new."purchase_date";
				trigger_row."companyname__c" = new."company_name";
				trigger_row."companynamekana__c" = new."company_name_kana";
				trigger_row."departmentname__c" = new."department_name";
				trigger_row."jobtitle__c" = new."job_title";
				trigger_row."name" = 'Heroku連携';
				trigger_row."username__c" = new."username";
				trigger_row."firstname__c" = new."first_name";
				trigger_row."lastnamekana__c" = new."username_kana";
				trigger_row."firstnamekana__c" = new."first_name_kana";
				trigger_row."postalcode__c" = new."postal_code";
				trigger_row."prefectures__c" = new."prefectures";
				trigger_row."citytownname__c" = new."city_town_name";
				trigger_row."addressbuildingname__c" = new."address_building_name";
				trigger_row."tel__c" = new."Tel";
				trigger_row."mailadress__c" = new."mail_adress";
				trigger_row."total__c" = new."total";
				trigger_row."attendance__c" = new."attendance";
				trigger_row."textdestination__c" = new."text_destination";
				trigger_row."departmentnametwo__c" = new."department_name_two";
				trigger_row."usernametwo__c" = new."usernameTwo";
				trigger_row."firstnametwo__c" = new."first_name_two";
				trigger_row."lastnamekanatwo__c" = new."last_name_kana_two";
				trigger_row."firstnamekanatwo__c" = new."first_name_kana_two";
				trigger_row."mailadresstwo__c" = new."mail_adress_two";
				trigger_row."attendancetwo__c" = new."attendance_two";
				trigger_row."textdestinationtwo__c" = new."text_destination_two";
				trigger_row."departmentnamethree__c" = new."department_name_three";
				trigger_row."usernamethree__c" = new."username_three";
				trigger_row."firstnamethree__c" = new."first_name_three";
				trigger_row."lastnamekanathree__c" = new."last_name_kana_three";
				trigger_row."firstnamekanathree__c" = new."first_name_kana_three";
				trigger_row."mailadressthree__c" = new."mail_adress_three";
				trigger_row."attendancethree__c" = new."attendance_three";
				trigger_row."textdestinationthree__c" = new."text_destination_three";
				trigger_row."courseinformation__c" = new."course_information";
				trigger_row."paymentmethod__c" = new."payment_method";
				trigger_row."invoiceaddress__c" = new."invoice_address";
				trigger_row."information__c" = new."information";
				trigger_row."trigger1__c" = new."trigger_1";
				trigger_row."trigger2__c" = new."trigger_2";
				trigger_row."trigger3__c" = new."trigger_3";
				trigger_row."trigger4__c" = new."trigger_4";
				trigger_row."trigger5__c" = new."trigger_5";
				trigger_row."trigger6__c" = new."trigger_6";
				trigger_row."trigger7__c" = new."trigger_7";
				trigger_row."other__c" = new."other";
				trigger_row."orderingparty__c" = new."ordering_party";
				trigger_row."questionnaire1__c" = new."questionnaire_1";
				trigger_row."questionnaire2__c" = new."questionnaire_2";
				trigger_row."questionnaire3__c" = new."questionnaire_3";
				trigger_row."questionnaire4__c" = new."questionnaire_4";
				trigger_row."bookformat__c" = new."book_format";
				trigger_row."opinionsandrequests__c" = new."opinions_and_requests";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."gmpshop_order__c_id_seq"');

                INSERT INTO "salesforce"."gmpshop_order__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE' AND new."invoice_address" !~~ 'LSMIP%') THEN
                UPDATE "salesforce"."gmpshop_order__c" set 
					-- userid__c = new."UserId",
					seminarpurchase__c = new."seminar",
					displaylanguage__c = new."display_language",
					purchasedate__c = new."purchase_date",
					companyname__c = new."company_name",
					companynamekana__c = new."company_name_kana",
					departmentname__c = new."department_name",
					jobtitle__c = new."job_title",
					username__c = new."username",
					firstname__c = new."first_name",
					lastnamekana__c = new."username_kana",
					firstnamekana__c = new."first_name_kana",
					postalcode__c = new."postal_code",
					prefectures__c = new."prefectures",
					citytownname__c = new."city_town_name",
					addressbuildingname__c = new."address_building_name",
					tel__c = new."tel",
					mailadress__c = new."mail_adress",
					total__c = new."total",
					attendance__c = new."attendance",
					textdestination__c = new."text_destination",
					departmentnametwo__c = new."department_name_two",
					usernametwo__c = new."username_two",
					firstnametwo__c = new."first_name_two",
					lastnamekanatwo__c = new."last_name_kana_two",
					firstnamekanatwo__c = new."first_name_kana_two",
					mailadresstwo__c = new."mail_adress_two",
					attendancetwo__c = new."attendance_two",
					textdestinationtwo__c = new."text_destination_two",
					departmentnamethree__c = new."department_name_three",
					usernamethree__c = new."username_three",
					firstnamethree__c = new."first_name_three",
					lastnamekanathree__c = new."last_name_kana_three",
					firstnamekanathree__c = new."first_name_kana_three",
					mailadressthree__c = new."mail_adress_three",
					attendancethree__c = new."attendance_three",
					textdestinationthree__c = new."text_destination_three",
					courseinformation__c = new."course_information",
					paymentmethod__c = new."payment_method",
					invoiceaddress__c = new."invoice_address",
					information__c = new."information",
					trigger1__c = new."trigger_1",
					trigger2__c = new."trigger_2",
					trigger3__c = new."trigger_3",
					trigger4__c = new."trigger_4",
					trigger5__c = new."trigger_5",
					trigger6__c = new."trigger_6",
					trigger7__c = new."trigger_7",
					other__c = new."other",
					orderingparty__c = new."ordering_party",
					questionnaire1__c = new."questionnaire_1",
					questionnaire2__c = new."questionnaire_2",
					questionnaire3__c = new."questionnaire_3",
					questionnaire4__c = new."questionnaire_4",
					bookformat__c = new."book_format",
					opinionsandrequests__c = new."opinions_and_requests"

				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
