CREATE OR REPLACE FUNCTION salesforce.hc_category__c_logger()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

        DECLARE
            trigger_row "salesforce"."_trigger_log";
            excluded_cols text[] = ARRAY['_hc_lastop', '_hc_err']::text[];

        BEGIN
            -- VERSION 4 --
            trigger_row = ROW();
            trigger_row.id = nextval('"salesforce"."_trigger_log_id_seq"');
            trigger_row.action = TG_OP::text;
            trigger_row.table_name = TG_TABLE_NAME::text;
            trigger_row.txid = txid_current();
            trigger_row.created_at = clock_timestamp();
            trigger_row.state = 'NEW';

            IF (TG_OP = 'DELETE') THEN
                trigger_row.record_id = OLD.id;
                trigger_row.old = hstore(OLD.*) - excluded_cols;
                IF (OLD.sfid IS NOT NULL) THEN
                    trigger_row.sfid = OLD.sfid;
                
                ELSE
                    trigger_row.state = 'IGNORE';
                END IF;
            ELSEIF (TG_OP = 'INSERT') THEN
                trigger_row.record_id = NEW.id;
                trigger_row.values = hstore(NEW.*) - excluded_cols;
            ELSEIF (TG_OP = 'UPDATE') THEN
                trigger_row.record_id = NEW.id;
                trigger_row.old = hstore(OLD.*) - excluded_cols;
                trigger_row.values = (hstore(NEW.*) - hstore(trigger_row.old)) - excluded_cols;
                
                IF (trigger_row.values = '') THEN
                    -- nothing changed, ignore
                    trigger_row.state = 'IGNORE';
                END IF;
                IF (OLD.sfid IS NOT NULL) THEN
                    trigger_row.sfid = OLD.sfid;
                END IF;
            END IF;

            INSERT INTO "salesforce"."_trigger_log" VALUES (trigger_row.*);

            RETURN NULL;
        END;
        $function$
;
