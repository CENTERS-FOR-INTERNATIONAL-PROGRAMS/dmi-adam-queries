CREATE VIEW view_dataset_acute_flaccid_paralysis AS
SELECT 
    (couchdb.doc ->> 'ident')::BIGINT AS case_unique_id,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'given'::text ->> 'df_value') AS case_given_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'family'::text ->> 'df_value') AS case_family_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'gender'::text ->> 'df_value') AS case_gender,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'country'::text ->> 'df_value') AS case_residential_country,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'county'::text ->> 'df_value') AS case_residential_county,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'subcounty'::text ->> 'df_value') AS case_residential_subcounty,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_of_birth'::text ->> 'df_value')::text AS case_date_of_birth,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_years'::text ->> 'df_value')::float AS case_age_years,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'age_months'::text ->> 'df_value')::float AS case_age_months,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'phone_number'::text ->> 'df_value') AS case_phone_number,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'occupation'::text ->> 'df_value') AS case_occupation,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'occupation_other'::text ->> 'df_value') AS case_occupation_other,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_residence'::text ->> 'df_value') AS case_title_residence,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'town_village_camp'::text ->> 'df_value') AS case_town_village_camp,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'landmark'::text ->> 'df_value') AS case_landmark,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_parent_guradian'::text ->> 'df_value') AS case_title_parent_guradian,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_family_name'::text ->> 'df_value') AS case_guardian_family_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_given_name'::text ->> 'df_value') AS case_guardian_given_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'guardian_phone_number'::text ->> 'df_value') AS case_guardian_phone_number,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_respondent'::text ->> 'df_value') AS case_title_respondent,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent'::text ->> 'df_value') AS case_respondent,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_family_name'::text ->> 'df_value') AS case_respondent_family_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_given_name'::text ->> 'df_value') AS case_respondent_given_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_address'::text ->> 'df_value') AS case_respondent_address,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_phone_number'::text ->> 'df_value') AS case_respondent_phone_number,
    (((couchdb.doc -> 'DForms'::text) -> 'case_demographics'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'respondent_relationship'::text ->> 'df_value') AS case_respondent_relationship,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_of_onset'::text ->> 'df_value')::text AS case_paralysis_date_of_onset,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'fever_at_onset_of_paralysis'::text ->> 'df_value') AS fever_at_onset_of_paralysis,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'progressive_paralysis'::text ->> 'df_value') AS progressive_paralysis,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'paralysis_acute_and_flaccid'::text ->> 'df_value') AS paralysis_acute_and_flaccid,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'paralysis_asymmetrical'::text ->> 'df_value') AS paralysis_asymmetrical,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'paralysis_site'::text ->> 'df_value') AS paralysis_site,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'paralysis_site_other'::text ->> 'df_value') AS paralysis_site_other,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'paralyzed_limb_sensitive_to_pain'::text ->> 'df_value') AS paralyzed_limb_sensitive_to_pain,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'injection_before_paralysis'::text ->> 'df_value') AS injection_before_paralysis,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'injection_site'::text ->> 'df_value') AS injection_site,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'provisial_diagnosis'::text ->> 'df_value') AS provisional_diagnosis,
    (((couchdb.doc -> 'DForms'::text) -> 'case_investigation_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'outcome'::text ->> 'df_value') AS case_outcome,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'record_exposure'::text ->> 'df_value') AS record_exposure,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'exposure_type'::text ->> 'df_value') AS exposure_type,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'food_name'::text ->> 'df_value') AS food_name,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'food_consumption_date'::text ->> 'df_value')::text AS food_consumption_date,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'food_source'::text ->> 'df_value') AS food_source,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'food_participants_count'::text ->> 'df_value')::float AS food_participants_count,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'food_affected_participants_count'::text ->> 'df_value')::float AS food_affected_participants_count,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'water_sources'::text ->> 'df_value') AS water_sources,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'water_sources_other'::text ->> 'df_value') AS water_sources_other,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'toilet_types'::text ->> 'df_value') AS toilet_types,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'toilet_types_other'::text ->> 'df_value') AS toilet_types_other,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'travel_origin_country'::text ->> 'df_value') AS travel_origin_country,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'travel_origin_city'::text ->> 'df_value') AS travel_origin_city,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'travel_departure_date'::text ->> 'df_value')::text AS travel_departure_date,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'travel_destination_country'::text ->> 'df_value') AS travel_destination_country,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'travel_destination_city'::text ->> 'df_value') AS travel_destination_city,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'travel_arrival_date'::text ->> 'df_value')::text AS travel_arrival_date,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_exposure'::text ->> 'df_value') AS animal_exposure,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_exposure_other'::text ->> 'df_value') AS animal_exposure_other,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_species'::text ->> 'df_value') AS animal_species,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_species_other'::text ->> 'df_value') AS animal_species_other,
    (((couchdb.doc -> 'DForms'::text) -> 'case_exposure'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'animal_exposure_location'::text ->> 'df_value') AS animal_exposure_location,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'total_vaccine_doses'::text ->> 'df_value')::float AS total_vaccine_doses,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_of_opv_doses_at_birth'::text ->> 'df_value')::text AS date_of_opv_doses_at_birth,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'first_dose_date'::text ->> 'df_value')::text AS first_dose_date,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'second_dose_date'::text ->> 'df_value')::text AS second_dose_date,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'third_dose_date'::text ->> 'df_value')::text AS third_dose_date,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'fourth_dose_date'::text ->> 'df_value')::text AS fourth_dose_date,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'last_dose_date'::text ->> 'df_value')::text AS last_dose_date,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'last_opv_sia_dose'::text ->> 'df_value')::text AS last_opv_sia_dose,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'total_opv_sia_doses'::text ->> 'df_value')::float AS total_opv_sia_doses,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'total_opv_ri_doses'::text ->> 'df_value')::float AS total_opv_ri_doses,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'total_ipv_sia_doses'::text ->> 'df_value')::float AS total_ipv_sia_doses,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'total_ipv_ri_doses'::text ->> 'df_value')::float AS total_ipv_ri_doses,
    (((couchdb.doc -> 'DForms'::text) -> 'vaccination_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_ipv_sia_ri'::text ->> 'df_value')::text AS date_ipv_sia_ri,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'stool_condition'::text ->> 'df_value') AS stool_condition,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_final_culture_result_available'::text ->> 'df_value')::text AS date_final_culture_result_available,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_specimen_received_in_ic_lab'::text ->> 'df_value')::text AS date_specimen_received_in_ic_lab,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'lab_id'::text ->> 'df_value') AS lab_id,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'final_cell_culture_result'::text ->> 'df_value') AS final_cell_culture_result,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_results_sent_to_national_epi'::text ->> 'df_value')::text AS date_results_sent_to_national_epi,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_isolate_sent_by_national_laboratory_to_regional_laboratory'::text ->> 'df_value')::text AS date_isolate_sent_by_national_laboratory_to_regional_laboratory,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_itd_results_sent_by_regional_laboratory'::text ->> 'df_value')::text AS date_itd_results_sent_by_regional_laboratory,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_itd_results_received_by_county'::text ->> 'df_value')::text AS date_itd_results_received_by_county,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_isolate_sent_for_sequencing'::text ->> 'df_value')::text AS date_isolate_sent_for_sequencing,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_final_results_sent_to_epi'::text ->> 'df_value')::text AS date_final_results_sent_to_epi,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'title_final_results'::text ->> 'df_value') AS title_final_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'w1_results'::text ->> 'df_value') AS w1_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'w2_results'::text ->> 'df_value') AS w2_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'w3_results'::text ->> 'df_value') AS w3_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'discordant_sabin'::text ->> 'df_value') AS discordant_sabin,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'sl1_results'::text ->> 'df_value') AS sl1_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'sl2_results'::text ->> 'df_value') AS sl2_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'sl3_results'::text ->> 'df_value') AS sl3_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'VDPV1_results'::text ->> 'df_value') AS VDPV1_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'VDPV2_results'::text ->> 'df_value') AS VDPV2_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'VDPV3_results'::text ->> 'df_value') AS VDPV3_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'RNEV_results'::text ->> 'df_value') AS RNEV_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_results_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'RNPENT_results'::text ->> 'df_value') AS RNPENT_results,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_collection_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_first_specimen_collected'::text ->> 'df_value')::text AS date_first_specimen_collected,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_collection_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_second_specimen_collected'::text ->> 'df_value')::text AS date_second_specimen_collected,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_collection_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_specimen_sent_to_national'::text ->> 'df_value')::text AS date_specimen_sent_to_national,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_collection_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_specimen_received_at_national'::text ->> 'df_value')::text AS date_specimen_received_at_national,
    (((couchdb.doc -> 'DForms'::text) -> 'specimen_collection_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'date_specimen_sent_to_lab'::text ->> 'df_value')::text AS date_specimen_sent_to_lab,
    (((couchdb.doc -> 'DForms'::text) -> 'final_classification_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'immunocompromised_status_suspected'::text ->> 'df_value') AS immunocompromised_status_suspected,
    (((couchdb.doc -> 'DForms'::text) -> 'final_classification_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'afp_final_case_classification'::text ->> 'df_value') AS afp_final_case_classification,
    (((couchdb.doc -> 'DForms'::text) -> 'final_classification_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'afp_vdpv_serotype'::text ->> 'df_value') AS afp_vdpv_serotype,
    (((couchdb.doc -> 'DForms'::text) -> 'patient_movements_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'place'::text ->> 'df_value') AS patient_movement_place,
    (((couchdb.doc -> 'DForms'::text) -> 'patient_movements_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'duration_months'::text ->> 'df_value')::float AS patient_movement_duration_months,
    (((couchdb.doc -> 'DForms'::text) -> 'patient_movements_afp'::text) -> 0 -> 'DFields'::text -> 'values'::text -> 'duration_days'::text ->> 'df_value')::float AS patient_movement_duration_days,
    ((couchdb.doc -> 'DFields'::text) -> 'values'::text -> 'date_of_investigation'::text ->> 'df_value')::text AS case_investigation_date,
    ((couchdb.doc -> 'DFields'::text) -> 'values'::text -> 'EPID'::text ->> 'df_value') AS epid,
    ((couchdb.doc -> 'DFields'::text) -> 'values'::text -> 'disease'::text ->> 'df_value') AS disease,
    couchdb.doc ->> 'fform_id' AS fform_id,
    ((couchdb.doc -> 'location'::text) ->> 'accuracy')::float AS location_accuracy,
    ((couchdb.doc -> 'location'::text) ->> 'latitude')::FLOAT AS location_latitude,
    ((couchdb.doc -> 'location'::text) ->> 'longitude')::FLOAT AS location_longitude,
    couchdb.doc ->> 'mform_id' AS mform_id,
    couchdb.doc ->> 'created_username' AS created_username,
    couchdb.doc ->> 'created_timestamp' AS created_timestamp,
    couchdb.doc ->> 'modified_username' AS modified_username,
    couchdb.doc ->> 'modified_timestamp' AS modified_timestamp,
    couchdb.doc AS doc
FROM couchdb
WHERE 
    (couchdb.doc ->> 'type') = 'dform'
    AND (couchdb.doc -> 'DFields'::text -> 'values'::text -> 'disease'::text ->> 'df_value') = 'AFP'
    AND (couchdb.doc ->> 'ident') IS NOT NULL;

ALTER TABLE view_dataset_acute_flaccid_paralysis
    OWNER TO postgres_root;