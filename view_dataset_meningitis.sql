DROP VIEW IF EXISTS view_dataset_meningitis;
CREATE VIEW view_dataset_meningitis AS
SELECT
    (doc ->> 'ident')::text AS case_unique_id,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'given') ->> 'df_value')::text) AS given_name,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'family') ->> 'df_value')::text) AS family_name,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'gender') ->> 'df_value')::text) AS gender,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'date_of_birth') ->> 'df_value')::text) AS date_of_birth,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'age_months') ->> 'df_value')::text) AS age_months,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'age_years') ->> 'df_value')::text) AS age_years,
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
    END as gender_clean,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'phone_number') ->> 'df_value')::text) AS phone_number,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'occupation') ->> 'df_value')::text) AS occupation,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'occupation_other') ->> 'df_value')::text) AS occupation_other,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'title_residence') ->> 'df_value')::text) AS title_residence,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'country') ->> 'df_value')::text) AS country,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'county') ->> 'df_value')::text) AS county,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'subcounty') ->> 'df_value')::text) AS subcounty,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'town_village_camp') ->> 'df_value')::text) AS town_village_camp,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'landmark') ->> 'df_value')::text) AS landmark,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'title_parent_guradian') ->> 'df_value')::text) AS title_parent_guardian,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'guardian_family_name') ->> 'df_value')::text) AS guardian_family_name,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'guardian_given_name') ->> 'df_value')::text) AS guardian_given_name,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'guardian_phone_number') ->> 'df_value')::text) AS guardian_phone_number,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'title_respondent') ->> 'df_value')::text) AS title_respondent,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'respondent') ->> 'df_value')::text) AS respondent,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'respondent_family_name') ->> 'df_value')::text) AS respondent_family_name,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'respondent_given_name') ->> 'df_value')::text) AS respondent_given_name,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'respondent_address') ->> 'df_value')::text) AS respondent_address,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'respondent_phone_number') ->> 'df_value')::text) AS respondent_phone_number,
    (((doc -> 'DForms' -> 'case_demographics' -> 0 -> 'DFields' -> 'values' -> 'respondent_relationship') ->> 'df_value')::text) AS respondent_relationship,
    (((doc -> 'DForms' -> 'reporting_location' -> 0 -> 'DFields' -> 'values' -> 'county') ->> 'df_value')::text) AS reporting_county,
    (((doc -> 'DForms' -> 'reporting_location' -> 0 -> 'DFields' -> 'values' -> 'subcounty') ->> 'df_value')::text) AS reporting_subcounty,
    (((doc -> 'DForms' -> 'reporting_location' -> 0 -> 'DFields' -> 'values' -> 'health_facility') ->> 'df_value')::text) AS reporting_health_facility,
    (((doc -> 'DForms' -> 'vaccination_meningitis' -> 0 -> 'DFields' -> 'values' -> 'vaccine') ->> 'df_value')::text) AS vaccine,
    (((doc -> 'DForms' -> 'vaccination_meningitis' -> 0 -> 'DFields' -> 'values' -> 'vaccine_doses') ->> 'df_value')::int) AS vaccine_doses,
    (((doc -> 'DForms' -> 'vaccination_meningitis' -> 0 -> 'DFields' -> 'values' -> 'vaccine_last_dose_date') ->> 'df_value')::text) AS vaccine_last_dose_date,
    (((doc -> 'DForms' -> 'vaccination_meningitis' -> 0 -> 'DFields' -> 'values' -> 'vaccine_information_source') ->> 'df_value')::text) AS vaccine_information_source,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'lumbar_puncture_date') ->> 'df_value')::text) AS lumbar_puncture_date,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'lumbar_puncture_time') ->> 'df_value')::text) AS lumbar_puncture_time,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'celebrospinal_fluid_appearance') ->> 'df_value')::text) AS celebrospinal_fluid_appearance,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'inoculation_date') ->> 'df_value')::text) AS inoculation_date,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'inoculation_time') ->> 'df_value')::text) AS inoculation_time,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'sample_transport_medium') ->> 'df_value')::text) AS sample_transport_medium,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'sample_transport_medium_others') ->> 'df_value')::text) AS sample_transport_medium_others,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'laboratory_test_requested') ->> 'df_value')::text) AS laboratory_test_requested,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'reference_laboratory') ->> 'df_value')::text) AS reference_laboratory,
    (((doc -> 'DForms' -> 'laboratory_sample_meningitis' -> 0 -> 'DFields' -> 'values' -> 'patient_on_treatment') ->> 'df_value')::text) AS patient_on_treatment,
    (((doc -> 'DForms' -> 'clinical_information_meningitis' -> 0 -> 'DFields' -> 'values' -> 'symptoms') ->> 'df_value')::text) AS symptoms,
    (((doc -> 'DForms' -> 'clinical_information_meningitis' -> 0 -> 'DFields' -> 'values' -> 'date_of_onset') ->> 'df_value')::text) AS date_of_onset,
    (((doc -> 'DForms' -> 'clinical_information_meningitis' -> 0 -> 'DFields' -> 'values' -> 'health_facility') ->> 'df_value')::text) AS clinical_health_facility,
    (((doc -> 'DForms' -> 'clinical_information_meningitis' -> 0 -> 'DFields' -> 'values' -> 'date_first_seen_at_facility') ->> 'df_value')::text) AS date_first_seen_at_facility,
    (((doc -> 'DForms' -> 'clinical_information_meningitis' -> 0 -> 'DFields' -> 'values' -> 'admission_date') ->> 'df_value')::text) AS admission_date,
    (((doc -> 'DForms' -> 'clinical_information_meningitis' -> 0 -> 'DFields' -> 'values' -> 'patient_status') ->> 'df_value')::text) AS patient_status,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'syndrome'::text) ->> 'df_value'::text AS syndrome,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'disease'::text) ->> 'df_value'::text AS disease,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'EPID'::text) ->> 'df_value'::text AS epid,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'date_of_investigation'::text) ->> 'df_value'::text AS date_of_investigation,
    doc ->> 'fform_id' AS form_id,
    ((doc -> 'location'::text) ->> 'accuracy')::float AS location_accuracy,
    ((doc -> 'location'::text) ->> 'latitude')::float AS location_latitude,
    ((doc -> 'location'::text) ->> 'longitude')::float AS location_longitude,
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
FROM 
    couchdb
WHERE 
    (doc ->> 'type') = 'dform'
    AND (((doc -> 'DFields' -> 'values') -> 'disease' ->> 'df_value') = 'Meningitis')
    AND (doc ->> 'ident') IS NOT NULL;

ALTER TABLE view_dataset_meningitis
    OWNER TO postgres_root;