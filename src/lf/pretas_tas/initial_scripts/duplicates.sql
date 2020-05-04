/**
* The table to track duplicates issues
*/
CREATE TABLE IF NOT EXISTS matabase_lf_tas_duplicates_202005(
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
    ON matabase_lf_tas_duplicates_202005(id_participant, barcode_participant);
  CREATE UNIQUE INDEX IF NOT EXISTS idx_duplicates_results_id_barcode
    ON matabase_lf_tas_duplicates_202005(id_results, barcode_results);

  ALTER TABLE matabase_lf_tas_duplicates_202005
    ADD CONSTRAINT unique_idx_duplicates_participant_id_barcode
    UNIQUE USING INDEX idx_duplicates_participant_id_barcode;

  ALTER TABLE matabase_lf_tas_duplicates_202005
    ADD CONSTRAINT unique_idx_duplicates_results_id_barcode
    UNIQUE USING INDEX idx_duplicates_results_id_barcode;
