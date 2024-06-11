DROP VIEW IF EXISTS view_dataset_measles;
CREATE VIEW view_dataset_measles AS
SELECT
    (doc ->> 'ident')::text AS case_unique_id,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'given'::text) ->> 'df_value'::text AS case_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'family'::text) ->> 'df_value'::text AS case_family_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'gender'::text) ->> 'df_value'::text AS case_gender,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'date_of_birth'::text) ->> 'df_value'::text AS case_date_of_birth,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'age_years'::text) ->> 'df_value'::text AS case_age_years,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'age_months'::text) ->> 'df_value'::text AS case_age_months,
    CASE
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float BETWEEN 0 AND 5 THEN '0-5 years'
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float BETWEEN 5.1 AND 17 THEN '5-17 years'
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float BETWEEN 17.1 AND 50 THEN '18-50 years'
        WHEN (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float > 50 THEN '51+ years'
        ELSE 'Unknown'
    END AS age_group,
    CASE
        WHEN lower((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value')) = 'male' THEN 'Male'
        WHEN lower((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value')) = 'female' THEN 'Female'
        ELSE 'Unknown'
    END as gender,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'phone_number'::text) ->> 'df_value'::text AS case_phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'occupation'::text) ->> 'df_value'::text AS case_occupation,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'occupation_other'::text) ->> 'df_value'::text AS case_occupation_other,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'country'::text) ->> 'df_value'::text AS case_residential_country,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'county'::text) ->> 'df_value'::text AS case_residential_county,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'subcounty'::text) ->> 'df_value'::text AS case_residential_subcounty,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'town_village_camp'::text) ->> 'df_value'::text AS case_residential_town_village_camp,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'landmark'::text) ->> 'df_value'::text AS case_landmark,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'title_residence'::text) ->> 'df_value'::text AS case_title_residence,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'title_parent_guardian'::text) ->> 'df_value'::text AS case_title_parent_guardian,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'guardian_family_name'::text) ->> 'df_value'::text AS case_guardian_family_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'guardian_given_name'::text) ->> 'df_value'::text AS case_guardian_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'guardian_phone_number'::text) ->> 'df_value'::text AS case_guardian_phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'title_respondent'::text) ->> 'df_value'::text AS case_title_respondent,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent'::text) ->> 'df_value'::text AS case_respondent,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_family_name'::text) ->> 'df_value'::text AS case_respondent_family_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_given_name'::text) ->> 'df_value'::text AS case_respondent_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_address'::text) ->> 'df_value'::text AS case_respondent_address,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_phone_number'::text) ->> 'df_value'::text AS case_respondent_phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_relationship'::text) ->> 'df_value'::text AS case_respondent_relationship,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent'::text) ->> 'df_value'::text AS case_res_respondent,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'family'::text) ->> 'df_value'::text AS case_res_family,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'given_name'::text) ->> 'df_value'::text AS case_res_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'phone_number'::text) ->> 'df_value'::text AS case_res_phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'address'::text) ->> 'df_value'::text AS case_res_address,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'relationship'::text) ->> 'df_value'::text AS case_res_relationship,
    ((((((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'relationship_other'::text) ->> 'df_value'::text AS case_res_relationship_other,
    ((((((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccinated'::text) ->> 'df_value'::text AS case_vac_vaccinated,
    ((((((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccine_name'::text) ->> 'df_value'::text AS case_vac_vaccine_name,
    ((((((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccine_doses'::text) ->> 'df_value'::text AS case_vac_vaccine_doses,
    ((((((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'health_facility'::text) ->> 'df_value'::text AS case_vac_health_facility,
    ((((((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccination_date'::text) ->> 'df_value'::text AS case_vac_vaccination_date,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_sample_collected'::text) ->> 'df_value'::text AS case_lab_laboratory_sample_collected,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_samples_collected'::text) ->> 'df_value'::text AS case_lab_laboratory_samples_collected,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_samples_collected_others'::text) ->> 'df_value'::text AS case_lab_laboratory_samples_collected_others,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'sample_date'::text) ->> 'df_value'::text AS case_lab_sample_date,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'rdt_done'::text) ->> 'df_value'::text AS case_lab_rdt_done,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'rdt_results'::text) ->> 'df_value'::text AS case_lab_rdt_results,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'samples_sent_to_laboratory'::text) ->> 'df_value'::text AS case_lab_samples_sent_to_laboratory,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_name'::text) ->> 'df_value'::text AS case_lab_laboratory_name,
    ((((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'sample_sent_to_lab_date'::text) ->> 'df_value'::text AS case_lab_sample_sent_to_lab_date,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'symptoms'::text) ->> 'df_value'::text AS symptoms,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'symptoms_other'::text) ->> 'df_value'::text AS symptoms_other,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'rash_type'::text) ->> 'df_value'::text AS rash_type,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'date_of_onset_rash'::text) ->> 'df_value'::text AS date_of_onset_rash,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'residence_visited'::text) ->> 'df_value'::text AS residence_visited,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'residence_visited_date'::text) ->> 'df_value'::text AS residence_visited_date,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'case_epilinked'::text) ->> 'df_value'::text AS case_epilinked,
    ((((((doc -> 'DForms'::text) -> 'clinical_information_measles'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'outcome'::text) ->> 'df_value'::text AS outcome,
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
FROM couchdb
WHERE (doc ->> 'type'::text) = 'dform'::text
  AND (((doc -> 'DFields'::text) -> 'values'::text) -> 'disease'::text) ->> 'df_value'::text = 'Measles'::text
  AND (doc -> 'ident'::text) IS NOT NULL;

ALTER TABLE view_dataset_measles
    OWNER TO postgres_root;