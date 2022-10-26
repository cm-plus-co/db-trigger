CREATE OR REPLACE FUNCTION public."custom_seminars_to_campaign_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."campaign";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "salesforce"."campaign" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."name" = 'OneCMP用のため削除厳禁';
				/*trigger_row."categoryid__c" = new."CategoryId";*/
				/*trigger_row."seminarimage__c" = new."SeminarImage";*/
				/*trigger_row."seminarimageen__c" = new."SeminarImageEn";*/
				/*trigger_row."opendate__c" = new."OpenDate";*/
				/*trigger_row."outlineoftheevent__c" = new."OutlineOfTheEvent";*/
				/*trigger_row."outlineoftheeventen__c" = new."OutlineOfTheEventEn";*/
				/*trigger_row."form__c" = new."Form";*/
				/*trigger_row."formen__c" = new."FormEn";*/
				/*trigger_row."place__c" = new."Venue";*/
				/*trigger_row."venueen__c" = new."VenueEn";*/
				/*trigger_row."title__c" = new."Title";*/
				/*trigger_row."titleen__c" = new."TitleEn";*/
				/*trigger_row."catchcopy__c" = new."CatchCopy";*/
				/*trigger_row."catchcopyen__c" = new."CatchCopyEn";*/
				/*trigger_row."header__c" = new."header";*/
				/*trigger_row."tagid__c" = new."TagId";*/
				/*trigger_row."metadiscription__c" = new."MetaDiscription";*/
				/*trigger_row."speaker__c" = new."Speaker";*/
				/*trigger_row."speakeren__c" = new."SpeakerEn";*/
				/*trigger_row."startdate" = new."HeldDateTime";*/
				/*trigger_row."helddatetimeen__c" = new."HeldDateTimeEn";*/
				/*trigger_row."resume__c" = new."Resume";*/
				/*trigger_row."resumeen__c" = new."ResumeEn";*/
				/*trigger_row."seminaritem__c" = new."SeminarItem";*/
				/*trigger_row."seminaritemen__c" = new."SeminarItemEn";*/
				/*trigger_row."languagetype__c" = new."LanguageType";*/
				/*trigger_row."displayonoff__c" = new."DisplayOnOff";*/
				trigger_row."metatitle__c" = new."meta_title";
				/*trigger_row."accessrestrictions__c" = new."AccessRestrictions";*/
				/*trigger_row."pickup__c" = new."PickUp";*/
				/*trigger_row."metakeyword__c" = new."MetaKeyword";*/
				/*trigger_row."publishstartdate__c" = new."PublishStartDate";*/
				/*trigger_row."publishenddate__c" = new."PublishEndDate";*/
				/*trigger_row."displaypriorityflag__c" = new."DisplayPriorityFlag";*/
				/*trigger_row."applicationnotes__c" = new."ApplicationNotes";*/
				/*trigger_row."applicationnotesen__c" = new."ApplicationNotesEn";*/
				/*trigger_row."trainingprogramflag__c" = new."TrainingProgramFlag";*/
				trigger_row."end_date__c" = new."campaign";
				trigger_row."holding_period__c" = new."display_date_time";
				-- trigger_row."productname__c" = new."ProductName";
				/*trigger_row."strapientryname__c" = new."StrapiEntryName";*/
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."campaign_id_seq"');

                INSERT INTO "salesforce"."campaign" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "salesforce"."campaign" set 
					/*categoryid__c = new."CategoryId",*/
					/*seminarimage__c = new."SeminarImage",*/
					/*seminarimageen__c = new."SeminarImageEn",*/
					/*opendate__c = new."OpenDate",*/
					/*outlineoftheevent__c = new."OutlineOfTheEvent",*/
					/*outlineoftheeventen__c = new."OutlineOfTheEventEn",*/
					/*form__c = new."Form",*/
					/*formen__c = new."FormEn",*/
					/*place__c = new."Venue",*/
					/*venueen__c = new."VenueEn",*/
					/*title__c = new."Title",*/
					/*titleen__c = new."TitleEn",*/
					/*catchcopy__c = new."CatchCopy",*/
					/*catchcopyen__c = new."CatchCopyEn",*/
					/*header__c = new."header",*/
					/*tagid__c = new."TagId",*/
					/*metadiscription__c = new."MetaDiscription",*/
					/*speaker__c = new."Speaker",*/
					/*speakeren__c = new."SpeakerEn",*/
					startdate = new."held_date_time",
					end_date__c = new."campaign",
					holding_period__c = new."display_date_time",
					/*helddatetimeen__c = new."HeldDateTimeEn",*/
					/*resume__c = new."Resume",*/
					/*resumeen__c = new."ResumeEn",*/
					/*seminaritem__c = new."SeminarItem",*/
					/*seminaritemen__c = new."SeminarItemEn",*/
					/*languagetype__c = new."LanguageType",*/
					/*displayonoff__c = new."DisplayOnOff",*/
					metatitle__c = new."meta_title",
					/*accessrestrictions__c = new."AccessRestrictions",*/
					/*pickup__c = new."PickUp",*/
					/*metakeyword__c = new."MetaKeyword",*/
					/*publishstartdate__c = new."PublishStartDate",*/
					/*publishenddate__c = new."PublishEndDate",*/
					/*displaypriorityflag__c = new."DisplayPriorityFlag",*/
					/*applicationnotes__c = new."ApplicationNotes",*/
					/*applicationnotesen__c = new."ApplicationNotesEn",*/
					/*trainingprogramflag__c = new."TrainingProgramFlag"*/
					-- productname__c = new."ProductName"
					/*strapientryname__c = new."StrapiEntryName"*/
				WHERE id__c = Text(new."id");
	
            END IF;

            RETURN NULL;
        END;
$function$
;
