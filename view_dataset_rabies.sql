DROP VIEW IF EXISTS view_dataset_rabies;
CREATE VIEW view_dataset_rabies AS
SELECT 
    doc -> 'ident'::text AS case_unique_id,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent'::text ->> 'df_value') AS repondent,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'family'::text ->> 'df_value') AS repondent_family_name,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'given_name'::text ->> 'df_value') AS repondent_given_name,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'phone_number'::text ->> 'df_value') AS repondent_phone_number,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'address'::text ->> 'df_value') AS repondent_address,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'relationship'::text ->> 'df_value') AS repondent_relationship,
    (((doc -> 'DForms'::text) -> 'case_repondent'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'relationship_other'::text ->> 'df_value') AS repondent_relationship_other,
    (((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'vaccinated'::text ->> 'df_value') AS vaccinated,
    (((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'vaccine_name'::text ->> 'df_value') AS vaccine_name,
    (((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'vaccine_doses'::text ->> 'df_value') AS vaccine_doses,
    (((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'health_facility'::text ->> 'df_value') AS health_facility,
    ((((doc -> 'DForms'::text) -> 'case_vaccination'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'vaccination_date'::text) ->> 'df_value') AS vaccination_date,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'given'::text ->> 'df_value') AS given_name,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'family'::text ->> 'df_value') AS family_name,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value') AS gender,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_of_birth'::text ->> 'df_value')::text AS date_of_birth,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_months'::text ->> 'df_value')::integer AS age_months,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::integer AS age_years,
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
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'phone_number'::text ->> 'df_value') AS phone_number,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'occupation'::text ->> 'df_value') AS occupation,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'occupation_other'::text ->> 'df_value') AS occupation_other,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_residence'::text ->> 'df_value') AS title_residence,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'country'::text ->> 'df_value') AS country,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'county'::text ->> 'df_value') AS county,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'subcounty'::text ->> 'df_value') AS subcounty,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'town_village_camp'::text ->> 'df_value') AS town_village_camp,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'landmark'::text ->> 'df_value') AS landmark,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_parent_guradian'::text ->> 'df_value') AS title_parent_guardian,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_family_name'::text ->> 'df_value') AS guardian_family_name,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_given_name'::text ->> 'df_value') AS guardian_given_name,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_phone_number'::text ->> 'df_value') AS guardian_phone_number,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_respondent'::text ->> 'df_value') AS title_respondent,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent'::text ->> 'df_value') AS respondent,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_family_name'::text ->> 'df_value') AS respondent_family_name,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_given_name'::text ->> 'df_value') AS respondent_given_name,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_address'::text ->> 'df_value') AS respondent_address,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_phone_number'::text ->> 'df_value') AS respondent_phone_number,
    (((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_relationship'::text ->> 'df_value') AS respondent_relationship,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'exposure_type_rabies'::text ->> 'df_value') AS exposure_type_rabies,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'exposure_date'::text ->> 'df_value')::text AS exposure_date,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'exposure_rabies_injury'::text ->> 'df_value') AS exposure_rabies_injury,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'exposure_rabies_injury_site'::text ->> 'df_value') AS exposure_rabies_injury_site,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_species'::text ->> 'df_value') AS animal_species,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_species_other'::text ->> 'df_value') AS animal_species_other,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_vaccinated'::text ->> 'df_value') AS animal_vaccinated,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_rabies_suspect'::text ->> 'df_value') AS animal_rabies_suspect,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_observed'::text ->> 'df_value') AS animal_observed,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_dead'::text ->> 'df_value') AS animal_dead,
    (((doc -> 'DForms'::text) -> 'case_exposure_rabies'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_dead_days'::text ->> 'df_value') AS animal_dead_days,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'case_seen_at_facility'::text ->> 'df_value') AS case_seen_at_facility,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'admitted'::text ->> 'df_value') AS admitted,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'health_facility_name'::text ->> 'df_value') AS health_facility_name,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'admission_date'::text ->> 'df_value')::text AS admission_date,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'inpatient_number'::text ->> 'df_value') AS inpatient_number,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'discharge_date'::text ->> 'df_value')::text AS discharge_date,
    (((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'patient_status'::text ->> 'df_value') AS patient_status,
    (doc -> 'DFields' -> 'values' -> 'EPID') ->> 'df_value' AS case_epid,
    (doc -> 'DFields' -> 'values' -> 'disease') ->> 'df_value' AS case_disease,
    (doc -> 'DFields' -> 'values' -> 'syndrome') ->> 'df_value' AS case_syndrome,
    ((doc -> 'DFields'::text) -> 'values'::text -> 'date_of_investigation'::text ->> 'df_value')::text AS case_investigation_date,
    doc ->> 'fform_id' AS fform_id,
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
WHERE 
  (doc ->> 'type'::text) = 'dform'::text 
  AND ((((doc -> 'DFields'::text) -> 'values'::text) -> 'disease'::text) ->> 'df_value'::text) = 'Rabies'::text 
  AND (doc -> 'ident'::text) IS NOT NULL;

ALTER TABLE view_dataset_rabies
    OWNER TO postgres_root;