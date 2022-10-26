CREATE OR REPLACE FUNCTION salesforce."custom_saleproducts_to_gmpshop_products__c_Function"()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
			trigger_row "public"."sale_products";
        BEGIN
            
            IF (TG_OP = 'DELETE') THEN
                DELETE FROM "public"."sale_products" WHERE id__c = Text(old.id);
            ELSEIF (TG_OP = 'INSERT') THEN
				trigger_row = ROW();
				trigger_row."product_kind" = new."product_category__c";
				trigger_row."product_name" = new."product_name__c";
				trigger_row."product_name_en" = new."productnameen__c";
				trigger_row."list_price" = new."list_price_heroku__c";
				trigger_row."currency" = new."currency__c";
				trigger_row."consumption_tax" = new."consumptiontax__c";
				trigger_row."id__c" = new."id";
				trigger_row."id" = nextval('"public"."sale_products_id_seq"');

                INSERT INTO "public"."sale_products" VALUES (trigger_row.*);
            ELSEIF (TG_OP = 'UPDATE') THEN
                UPDATE "public"."sale_products" set
					"product_kind" = new."product_category__c",
					"product_name" = new."product_name__c",
                    "product_name_en" = new."productnameen__c",
					"list_price" = new."list_price_heroku__c",
                    "currency" = new."currency__c",
                    "consumption_tax" = new."consumptiontax__c"
                WHERE id__c = Text(new."id");
            END IF;

            RETURN NULL;
        END;
$function$
;
