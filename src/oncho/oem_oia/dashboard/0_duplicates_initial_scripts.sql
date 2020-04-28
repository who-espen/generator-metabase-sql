/*
 * File: 0_duplicates_initial_scripts.sql
 * File Created: Friday, 24th April 2020 11:00:14 am
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 28th April 2020 3:13:19 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UHC/ESPEN
 */


/*
 * Variable to rename <%matabase_oncho_oem_duplicates_202004%>, <%v_ab_cde_fgh_3_participant%>, <%v_ab_cde_fgh_3_dbs%>
 */

BEGIN;

/**
* The table to track duplicates issues
*/
CREATE TABLE IF NOT EXISTS <%matabase_oncho_oem_duplicates_202004%>(
  id SERIAL PRIMARY KEY,
  id_participant INTEGER NULL, -- The id from participant table
  barcode_participant VARCHAR(255) NULL, -- The barcode from participant table
  id_results INTEGER NULL, -- The id from result table
  barcode_results VARCHAR(255) NULL, -- The barcode from result table
  form VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL DEFAULT 'Unsolved'
  );



/**
* Adding unique index in the duplicates tables
*/
  CREATE UNIQUE INDEX IF NOT EXISTS idx_duplicates_participant_id_barcode
    ON <%matabase_oncho_oem_duplicates_202004%>(id_participant, barcode_participant);
  CREATE UNIQUE INDEX IF NOT EXISTS idx_duplicates_results_id_barcode
    ON <%matabase_oncho_oem_duplicates_202004%>(id_results, barcode_results);

  ALTER TABLE <%matabase_oncho_oem_duplicates_202004%>
    ADD CONSTRAINT unique_idx_duplicates_participant_id_barcode
    UNIQUE USING INDEX idx_duplicates_participant_id_barcode;

  ALTER TABLE <%matabase_oncho_oem_duplicates_202004%>
    ADD CONSTRAINT unique_idx_duplicates_results_id_barcode
    UNIQUE USING INDEX idx_duplicates_results_id_barcode;



/**
* Get all dupplicates records from the participant table and
* and will insert it to the duplicate table created above.
* Returns: trigger
*/
CREATE OR REPLACE FUNCTION identify_participant_duplicate() RETURNS TRIGGER AS $$
   BEGIN

      IF EXISTS(
        SELECT src.id, src.p_barcode_id FROM <%v_ab_cde_fgh_3_participant%> src
          WHERE src.p_barcode_id = NEW.p_barcode_id
            AND (SELECT count (*)  FROM <%v_ab_cde_fgh_3_participant%> inr WHERE src.p_barcode_id = inr.p_barcode_id ) > 1
            ) THEN

        INSERT INTO <%matabase_oncho_oem_duplicates_202004%>(id_participant, barcode_participant, form)
          SELECT id, p_barcode_id, 'Participant'
            FROM (SELECT src.id, src.p_barcode_id FROM <%v_ab_cde_fgh_3_participant%> src
              WHERE src.p_barcode_id = NEW.p_barcode_id) p
          ON CONFLICT ON CONSTRAINT unique_idx_duplicates_participant_id_barcode DO NOTHING;

      END IF;
      RETURN NEW;
   END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER matabase_oncho_oem_duplicates_202004_trigger AFTER INSERT OR UPDATE OR DELETE ON <%v_ab_cde_fgh_3_participant%>
FOR EACH ROW EXECUTE PROCEDURE identify_participant_duplicate();


/**
* Query to identifie the existing records with duplicates issues
*/
 INSERT INTO <%matabase_oncho_oem_duplicates_202004%>(id_participant, barcode_participant, form)
 SELECT id, p_barcode_id, 'Participant'
            FROM (
              SELECT src.id, src.p_barcode_id FROM <%v_ab_cde_fgh_3_participant%> src
                WHERE (SELECT count (*)  FROM <%v_ab_cde_fgh_3_participant%> inr WHERE src.p_barcode_id = inr.p_barcode_id ) > 1
            ) p

ON CONFLICT ON CONSTRAINT unique_idx_duplicates_participant_id_barcode DO NOTHING;

COMMIT;

/*******************************************************************************************************************************************
 * Use the query bellow only of you have diagnostic table in the database
 *******************************************************************************************************************************************/
BEGIN;

/**
* This function to get all dupplicates records from the diagnostic table and
* and will insert it to the duplicate table created above.
* Returns: trigger
*/
CREATE OR REPLACE FUNCTION identify_diag_result_duplicate() RETURNS TRIGGER AS $$
   BEGIN

      IF EXISTS(
        SELECT src.id, d_barcode_id FROM <%v_ab_cde_fgh_3_dbs%> src
          WHERE d_barcode_id = NEW.d_barcode_id
            AND (SELECT count (*)  FROM <%v_ab_cde_fgh_3_dbs%> inr WHERE d_barcode_id = inr.d_barcode_id ) > 1
            ) THEN

        INSERT INTO <%matabase_oncho_oem_duplicates_202004%>(id_participant, barcode_participant, form)
          SELECT id, d_barcode_id, 'Diagnostic'
            FROM (SELECT src.id, d_barcode_id FROM <%v_ab_cde_fgh_3_dbs%> src
              WHERE d_barcode_id = NEW.d_barcode_id) p
          ON CONFLICT ON CONSTRAINT unique_idx_duplicates_results_id_barcode DO NOTHING;

      END IF;
      RETURN NEW;
   END;
$$ LANGUAGE PLPGSQL;


/**
* Query to identifie the existing records with duplicates issues
*/
 INSERT INTO <%matabase_oncho_oem_duplicates_202004%>(id_participant, barcode_participant, form)
 SELECT id, d_barcode_id, 'Diagnostic'
            FROM (
              SELECT src.id, src.d_barcode_id FROM <%v_ab_cde_fgh_3_dbs%> src
                WHERE (SELECT count (*)  FROM <%v_ab_cde_fgh_3_dbs%> inr WHERE src.d_barcode_id = inr.d_barcode_id ) > 1
            ) p

ON CONFLICT ON CONSTRAINT unique_idx_duplicates_results_id_barcode DO NOTHING;

COMMIT;

COMMIT;

