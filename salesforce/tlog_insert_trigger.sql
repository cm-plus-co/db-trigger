CREATE OR REPLACE FUNCTION salesforce.tlog_notify_trigger()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
            DECLARE
             BEGIN
               -- VERSION 1 --
               PERFORM pg_notify('salesforce.hc_trigger_log', 'ping');
               RETURN new;
             END;
            $function$
;
