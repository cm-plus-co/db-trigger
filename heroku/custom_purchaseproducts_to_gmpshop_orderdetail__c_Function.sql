CREATE OR REPLACE FUNCTION public."custom_purchaseproducts_to_gmpshop_orderdetail__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "salesforce"."gmpshop_orderdetail__c";
        BEGIN
            
            IF (TG_OP = 'DELETE' AND ((old."e_learning_id" IS NULL) OR (old."e_learning_id" != '7'))) THEN
                DELETE FROM "salesforce"."gmpshop_orderdetail__c" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT' AND ((new."e_learning_id" IS NULL) OR (new."e_learning_id" != '7'))) THEN
				trigger_row = ROW();
				trigger_row."booksid__c" = new."books_id";
				trigger_row."seminarid__c" = new."seminar_id";
				trigger_row."elearningid__c" = new."e_learning_id";
				-- trigger_row."purchaseid__c" = new."PurchaseId";
				trigger_row."selling_price__c" = new."unit_price";
				trigger_row."quantity__c" = new."quantity";
				trigger_row."order__c" = 'a2M5F00000FM0Ve';
				trigger_row."amountofmoney__c" = new."amount_of_money";
				trigger_row."desiredtimetostartusing__c" = new."desired_time_to_start_using";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"salesforce"."gmpshop_orderdetail__c_id_seq"');

                INSERT INTO "salesforce"."gmpshop_orderdetail__c" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE' AND ((new."e_learning_id" IS NULL) OR (new."e_learning_id" != '7'))) THEN
                UPDATE "salesforce"."gmpshop_orderdetail__c" set 
					booksid__c = new."books_id",
					seminarid__c = new."seminar_id",
					elearningid__c = new."e_learning_id",
					-- purchaseid__c = new."PurchaseId",
					unitprice__c = new."unit_price",
					quantity__c = new."quantity",
					amountofmoney__c = new."amount_of_money",
					desiredtimetostartusing__c = new."desired_time_to_start_using"
				WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
