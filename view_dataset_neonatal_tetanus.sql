DROP VIEW IF EXISTS view_dataset_neonatal_tetanus;
CREATE VIEW view_dataset_neonatal_tetanus AS
SELECT 
    doc -> 'ident'::text AS case_unique_id,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'given'::text ->> 'df_value'::text AS case_given_name,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'family'::text ->> 'df_value'::text AS case_family_name,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value'::text AS case_gender,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_of_birth'::text ->> 'df_value'::text AS case_date_of_birth,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_months'::text ->> 'df_value'::text AS case_age_months,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value'::text AS case_age_years,
    CASE
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float < 2 THEN 'Under 2 yrs'
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float BETWEEN 2 AND 5 THEN '2-5 yrs'
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float BETWEEN 5 AND 16 THEN '5-16 yrs'
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float > 16 THEN '16 and above years'
        ELSE 'Unknown'
    END AS age_group,
    CASE
        WHEN lower((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value')) = 'male' THEN 'Male'
        WHEN lower((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value')) = 'female' THEN 'Female'
        ELSE 'Unknown'
    END as gender,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'phone_number'::text ->> 'df_value'::text AS case_phone_number,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'occupation'::text ->> 'df_value'::text AS case_occupation,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'occupation_other'::text ->> 'df_value'::text AS case_occupation_other,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_residence'::text ->> 'df_value'::text AS case_title_residence,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'country'::text ->> 'df_value'::text AS case_country,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'county'::text ->> 'df_value'::text AS case_county,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'subcounty'::text ->> 'df_value'::text AS case_subcounty,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'town_village_camp'::text ->> 'df_value'::text AS case_town_village_camp,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'landmark'::text ->> 'df_value'::text AS case_landmark,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_parent_guradian'::text ->> 'df_value'::text AS case_title_parent_guardian,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_family_name'::text ->> 'df_value'::text AS case_guardian_family_name,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_given_name'::text ->> 'df_value'::text AS case_guardian_given_name,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_phone_number'::text ->> 'df_value'::text AS case_guardian_phone_number,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_respondent'::text ->> 'df_value'::text AS case_title_respondent,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent'::text ->> 'df_value'::text AS case_respondent,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_family_name'::text ->> 'df_value'::text AS case_respondent_family_name,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_given_name'::text ->> 'df_value'::text AS case_respondent_given_name,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_address'::text ->> 'df_value'::text AS case_respondent_address,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_phone_number'::text ->> 'df_value'::text AS case_respondent_phone_number,
    ((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_relationship'::text ->> 'df_value'::text AS case_respondent_relationship,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'case_seen_at_facility'::text) ->> 'df_value'::text AS case_seen_at_facility,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'admitted'::text) ->> 'df_value'::text AS admitted,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'health_facility_name'::text) ->> 'df_value'::text AS health_facility_name,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'admission_date'::text) ->> 'df_value'::text AS admission_date,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'inpatient_number'::text) ->> 'df_value'::text AS inpatient_number,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'discharge_date'::text) ->> 'df_value'::text AS discharge_date,
    ((((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'patient_status'::text) ->> 'df_value'::text AS patient_status,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'delivery_location'::text) ->> 'df_value'::text AS delivery_location,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'sterile_code_cutter'::text) ->> 'df_value'::text AS sterile_code_cutter,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'cord_stump_treated'::text) ->> 'df_value'::text AS cord_stump_treated,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'baby_age_days'::text) ->> 'df_value'::text AS baby_age_days,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'baby_suckling'::text) ->> 'df_value'::text AS baby_suckling,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'confirmed_nnt'::text) ->> 'df_value'::text AS confirmed_nnt,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'baby_treated_at_facility'::text) ->> 'df_value'::text AS baby_treated_at_facility,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'baby_mother_alive'::text) ->> 'df_value'::text AS baby_mother_alive,
    ((((((doc -> 'DForms'::text) -> 'case_investigation_nnt'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'outcome'::text) ->> 'df_value'::text AS outcome,
    doc -> 'DFields' -> 'values' -> 'disease' ->> 'df_value' AS disease,
    doc -> 'DFields' -> 'values' -> 'EPID' ->> 'df_value' AS epid,
    doc -> 'DFields' -> 'values' -> 'date_of_investigation' ->> 'df_value'::text AS date_of_investigation,
    doc ->> 'fform_id' AS fform_id,
    (doc -> 'location' ->> 'accuracy')::float AS location_accuracy,
    (doc -> 'location' ->> 'latitude')::float AS location_latitude,
    (doc -> 'location' ->> 'longitude')::float AS location_longitude,
    doc ->> 'mform_id' AS mform_id,
    doc ->> 'created_username' AS created_username,
    to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS') AS created_timestamp,
    doc ->> 'modified_username' AS modified_username,
    to_timestamp(doc ->> 'modified_timestamp', 'DD/MM/YYYY HH24:MI:SS') AS modified_timestamp,
    date_part('week', to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS')) AS case_week,
    date_part('day', to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS')) AS case_day,
    date_part('month', to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS')) AS case_month,
    date_part('year', to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS')) AS case_year,
    to_char(to_timestamp(doc ->> 'created_timestamp', 'DD/MM/YYYY HH24:MI:SS'), 'YYYY "W"IW') AS case_year_week,
    doc
FROM couchdb
WHERE (doc ->> 'type'::text) = 'dform'::text 
    AND ((((doc -> 'DFields'::text) -> 'values'::text) -> 'disease'::text) ->> 'df_value'::text) = 'Neonatal Tetanus'::text 
    AND (doc -> 'ident'::text) IS NOT NULL;

ALTER TABLE view_dataset_neonatal_tetanus
    OWNER TO postgres_root;