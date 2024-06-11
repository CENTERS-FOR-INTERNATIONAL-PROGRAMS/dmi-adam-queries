DROP VIEW IF EXISTS view_dataset_community_led_total_sanitation;
CREATE VIEW view_dataset_community_led_total_sanitation AS
SELECT 
    (doc ->> 'ident')::text AS case_unique_id,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'village'::text) ->> 'df_value')::text) AS village,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'sublocation_name'::text) ->> 'df_value')::text) AS sublocation_name,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'commuity_unit'::text) ->> 'df_value')::text) AS commuity_unit,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'location_name'::text) ->> 'df_value')::text) AS location_name,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'ward_name'::text) ->> 'df_value')::text) AS ward_name,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'subcounty'::text) ->> 'df_value')::text) AS subcounty,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_triggering_date'::text) ->> 'df_value')::date) AS clts_triggering_date,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_hcw_name'::text) ->> 'df_value')::text) AS clts_hcw_name,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_hcw_contact'::text) ->> 'df_value')::text) AS clts_hcw_contact,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_natural_leader_name'::text) ->> 'df_value')::text) AS clts_natural_leader_name,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_natural_leader_phone_number'::text) ->> 'df_value')::text) AS clts_natural_leader_phone_number,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'household_head_name'::text) ->> 'df_value')::text) AS household_head_name,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_number_of_people'::text) ->> 'df_value')::float) AS clts_number_of_people,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_male_number'::text) ->> 'df_value')::float) AS clts_male_number,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_female_number'::text) ->> 'df_value')::float) AS clts_female_number,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_children_number'::text) ->> 'df_value')::float) AS clts_children_number,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_at_trigger'::text) ->> 'df_value')::text) AS clts_at_trigger,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_household_latrine_before_trigger'::text) ->> 'df_value')::text) AS clts_household_latrine_before_trigger,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_household_handwashing_before_trigger'::text) ->> 'df_value')::text) AS clts_household_handwashing_before_trigger,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_commitments'::text) ->> 'df_value')::text) AS clts_commitments,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_commitment_latrine_construction_date'::text) ->> 'df_value')::date) AS clts_commitment_latrine_construction_date,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_commitment_latrine_under_construction'::text) ->> 'df_value')::text) AS clts_commitment_latrine_under_construction,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_commitment_latrine_completion_date'::text) ->> 'df_value')::date) AS clts_commitment_latrine_completion_date,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'title_clts_follow_up'::text) ->> 'df_value')::text) AS title_clts_follow_up,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_commitment_new_latrine_constructed'::text) ->> 'df_value')::text) AS clts_commitment_new_latrine_constructed,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'ctls_follow_up_handwashing_facility_constructed'::text) ->> 'df_value')::text) AS ctls_follow_up_handwashing_facility_constructed,
    (((((doc -> 'DFields'::text) -> 'values'::text) -> 'clts_followup_latrine_construction_date'::text) ->> 'df_value')::date) AS clts_followup_latrine_construction_date,
    doc ->> 'fform_id' AS form_id,
    (doc -> 'location' ->> 'accuracy')::float AS location_accuracy,
    (doc -> 'location' ->> 'latitude')::float AS location_latitude,
    (doc -> 'location' ->> 'longitude')::float AS location_longitude,
    doc ->> 'mform_id' AS mform_id,
    doc ->> 'created_username' AS created_username,
    to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS') AS created_timestamp,
    doc ->> 'modified_username' AS modified_username,
    to_timestamp(doc ->> 'modified_timestamp', 'DD/MM/YYYY HH24:MI:SS') AS modified_timestamp,
    doc
FROM couchdb
WHERE (doc ->> 'type'::text) = 'dform'::text
  AND (((((doc -> 'DFields'::text) -> 'values'::text) -> 'village'::text) ->> 'df_value')::text) IS NOT NULL
  AND (doc -> 'ident'::text) IS NOT NULL;

ALTER TABLE view_dataset_community_led_total_sanitation
    OWNER TO postgres_root;