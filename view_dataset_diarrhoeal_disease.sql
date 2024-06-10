DROP VIEW IF EXISTS view_dataset_diarrhoeal_disease;
CREATE VIEW view_dataset_diarrhoeal_disease AS
SELECT
    doc -> 'ident'::text AS case_unique_id,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'given'::text) ->> 'df_value'::text AS case_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'family'::text) ->> 'df_value'::text AS case_family_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'gender'::text) ->> 'df_value'::text AS case_gender,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'age_years'::text) ->> 'df_value'::text::int AS case_age_in_years,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'age_months'::text) ->> 'df_value'::text::int AS case_age_in_months,
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
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'country'::text) ->> 'df_value'::text AS case_residential_country,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'county'::text) ->> 'df_value'::text AS case_residential_county,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'subcounty'::text) ->> 'df_value'::text AS case_residential_subcounty,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'town_village_camp'::text) ->> 'df_value'::text AS case_residential_town_village_camp,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'phone_number'::text) ->> 'df_value'::text AS phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'occupation'::text) ->> 'df_value'::text AS occupation,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'occupation_other'::text) ->> 'df_value'::text AS occupation_other,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'title_residence'::text) ->> 'df_value'::text AS title_residence,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'country'::text) ->> 'df_value'::text AS country,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'county'::text) ->> 'df_value'::text AS county,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'subcounty'::text) ->> 'df_value'::text AS subcounty,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'town_village_camp'::text) ->> 'df_value'::text AS town_village_camp,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'landmark'::text) ->> 'df_value'::text AS landmark,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'title_parent_guradian'::text) ->> 'df_value'::text AS title_parent_guradian,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'guardian_family_name'::text) ->> 'df_value'::text AS guardian_family_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'guardian_given_name'::text) ->> 'df_value'::text AS guardian_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'guardian_phone_number'::text) ->> 'df_value'::text AS guardian_phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'title_respondent'::text) ->> 'df_value'::text AS title_respondent,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent'::text) ->> 'df_value'::text AS respondent,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_family_name'::text) ->> 'df_value'::text AS respondent_family_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_given_name'::text) ->> 'df_value'::text AS respondent_given_name,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_address'::text) ->> 'df_value'::text AS respondent_address,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_phone_number'::text) ->> 'df_value'::text AS respondent_phone_number,
    ((((((doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'respondent_relationship'::text) ->> 'df_value'::text AS respondent_relationship,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'record_exposure'::text ->> 'df_value'::text AS record_exposure,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'exposure_type'::text ->> 'df_value'::text AS exposure_type,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'food_name'::text ->> 'df_value'::text AS food_name,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'food_consumption_date'::text ->> 'df_value'::text::DATE AS food_consumption_date,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'food_source'::text ->> 'df_value'::text AS food_source,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'food_participants_count'::text ->> 'df_value'::text::int AS food_participants_count,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'food_affected_participants_count'::text ->> 'df_value'::text::int AS food_affected_participants_count,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'water_sources'::text ->> 'df_value'::text AS water_sources,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'water_sources_other'::text ->> 'df_value'::text AS water_sources_other,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'toilet_types'::text ->> 'df_value'::text AS toilet_types,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'toilet_types_other'::text ->> 'df_value'::text AS toilet_types_other,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'travel_origin_country'::text ->> 'df_value'::text AS travel_origin_country,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'travel_origin_city'::text ->> 'df_value'::text AS travel_origin_city,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'travel_departure_date'::text ->> 'df_value'::text::DATE AS travel_departure_date,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'travel_destination_country'::text ->> 'df_value'::text AS travel_destination_country,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'travel_destination_city'::text ->> 'df_value'::text AS travel_destination_city,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'travel_arrival_date'::text ->> 'df_value'::text::DATE AS travel_arrival_date,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'animal_exposure'::text ->> 'df_value'::text AS animal_exposure,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'animal_exposure_other'::text ->> 'df_value'::text AS animal_exposure_other,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'animal_species'::text ->> 'df_value'::text AS animal_species,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'animal_species_other'::text ->> 'df_value'::text AS animal_species_other,
    (((((doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'animal_exposure_location'::text ->> 'df_value'::text AS animal_exposure_location,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'case_seen_at_facility'::text ->> 'df_value'::text AS case_seen_at_facility,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'admitted'::text ->> 'df_value'::text AS admitted,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'health_facility_name'::text ->> 'df_value'::text AS health_facility_name,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'admission_date'::text ->> 'df_value'::text::DATE AS admission_date,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'inpatient_number'::text ->> 'df_value'::text AS inpatient_number,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'discharge_date'::text ->> 'df_value'::text::DATE AS discharge_date,
    (((((doc -> 'DForms'::text) -> 'case_hospitalization'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'patient_status'::text ->> 'df_value'::text AS patient_status,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'rdt_done'::text ->> 'df_value'::text AS rdt_done,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'rdt_results'::text ->> 'df_value'::text AS rdt_results,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'sample_date'::text ->> 'df_value'::text::DATE AS sample_date,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_name'::text ->> 'df_value'::text AS laboratory_name,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'sample_sent_to_lab_date'::text ->> 'df_value'::text::DATE AS sample_sent_to_lab_date,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'samples_sent_to_laboratory'::text ->> 'df_value'::text AS samples_sent_to_laboratory,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_sample_collected'::text ->> 'df_value'::text AS laboratory_sample_collected,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_samples_collected'::text ->> 'df_value'::text AS laboratory_samples_collected,
    (((((doc -> 'DForms'::text) -> 'case_lab_information'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'laboratory_samples_collected_others'::text ->> 'df_value'::text AS laboratory_samples_collected_others,    
    (((((doc -> 'DForms'::text) -> 'vaccination_diarrhoeal_disease'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccinated'::text ->> 'df_value'::text AS vaccinated,
    (((((doc -> 'DForms'::text) -> 'vaccination_diarrhoeal_disease'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccine_doses'::text ->> 'df_value'::text::int AS vaccine_doses,
    (((((doc -> 'DForms'::text) -> 'vaccination_diarrhoeal_disease'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'vaccination_date'::text ->> 'df_value'::text::date AS vaccination_date,
    (((((doc -> 'DForms'::text) -> 'clinical_information_diarrhoeal_diseases'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'date_of_onset'::text ->> 'df_value'::text::date AS date_of_onset,
    (((((doc -> 'DForms'::text) -> 'clinical_information_diarrhoeal_diseases'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'symptoms'::text ->> 'df_value'::text AS symptoms,
    (((((doc -> 'DForms'::text) -> 'clinical_information_diarrhoeal_diseases'::text) -> 0) -> 'DFields'::text) -> 'values'::text) -> 'symptoms_other'::text ->> 'df_value'::text AS symptoms_other,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'syndrome'::text) ->> 'df_value'::text AS syndrome,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'disease'::text) ->> 'df_value'::text AS disease,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'EPID'::text) ->> 'df_value'::text AS epid,
    (((doc -> 'DFields'::text) -> 'values'::text) -> 'date_of_investigation'::text) ->> 'df_value'::text::date AS date_of_investigation,
    doc ->> 'fform_id' AS form_id,
    (doc -> 'location'::text) ->> 'accuracy'::text::int AS location_accuracy,
    (doc -> 'location'::text) ->> 'latitude'::text::float AS location_latitude,
    (doc -> 'location'::text) ->> 'longitude'::text::float AS location_longitude,
    doc ->> 'mform_id' AS mform_id,
    doc ->> 'created_username' AS created_username,
    doc ->> 'created_timestamp' AS created_timestamp,
    doc ->> 'modified_username' AS modified_username,
    doc ->> 'modified_timestamp' AS modified_timestamp,
    doc

FROM couchdb
  WHERE (doc ->> 'type'::text) = 'dform'::text 
  AND ((((doc -> 'DFields'::text) -> 'values'::text) -> 'syndrome'::text) ->> 'df_value'::text) = 'Diarrhoeal Disease'::text 
  AND (doc -> 'ident'::text) IS NOT NULL;

alter table view_dataset_diarrhoeal_disease
    owner to postgres;
