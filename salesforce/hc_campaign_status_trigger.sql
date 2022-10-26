CREATE OR REPLACE FUNCTION salesforce.hc_campaign_status()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
                    BEGIN
                      IF (get_xmlbinary() = 'base64') THEN  -- user op
                        NEW._hc_lastop = 'PENDING';
                        NEW._hc_err = NULL;
                        RETURN NEW;
                      ELSE  -- connect op
                        IF (TG_OP = 'UPDATE' AND NEW._hc_lastop IS NOT NULL AND NEW._hc_lastop != OLD._hc_lastop) THEN
                            RETURN NEW;
                        END IF;

                        NEW._hc_lastop = 'SYNCED';
                        NEW._hc_err = NULL;
                        RETURN NEW;
                      END IF;
                    END;
                 $function$
;
