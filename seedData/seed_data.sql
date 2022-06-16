-- for each lookup table copy command
COPY visit_type (code, description) FROM '/opt/data/seedData/data/luVisitType.csv' CSV HEADER DELIMITER ',';
COPY taxon (
  code,
  commonName, 
  latinName,
  kingdomCommon,
  phylumCommon,
  classCommon,
  orderCommon,
  familyCommon,
  genusCommon,
  speciesCommon,
  subspeciesCommon,
  kingdomLatin,
  phylumLatin,
  classLatin,
  orderLatin,
  familyLatin,
  genusLatin,
  speciesLatin,
  subspeciesLatin
) FROM '/opt/data/seedData/data/luTaxon.csv' CSV HEADER DELIMITER ',';
COPY agency (code, description) FROM '/opt/data/seedData/data/luAgency.csv' CSV HEADER DELIMITER ',';
COPY equipment (code, description) FROM '/opt/data/seedData/data/luSampleGear.csv' CSV HEADER DELIMITER ',';
COPY light_condition (code, description) FROM '/opt/data/seedData/data/luLightCondition.csv' CSV HEADER DELIMITER ',';
COPY trap_funcionality (code, description) FROM '/opt/data/seedData/data/luTrapFunctioning.csv' CSV HEADER DELIMITER ',';
COPY fish_processed (code, description) FROM '/opt/data/seedData/data/luFishProcessed.csv' CSV HEADER DELIMITER ',';
COPY run (code, description) FROM '/opt/data/seedData/data/luRun.csv' CSV HEADER DELIMITER ',';
COPY run_code_method (code, description) FROM '/opt/data/seedData/data/luRunMethod.csv' CSV HEADER DELIMITER ',';
COPY life_stage (code, description) FROM '/opt/data/seedData/data/luLifestage.csv' CSV HEADER DELIMITER ',';
COPY release_purpose (code, description) FROM '/opt/data/seedData/data/luReleasePurpose.csv' CSV HEADER DELIMITER ',';
COPY fish_origin (code, description) FROM '/opt/data/seedData/data/luFishOrigin.csv' CSV HEADER DELIMITER ',';
COPY mark_type (code, description) FROM '/opt/data/seedData/data/luMarkType.csv' CSV HEADER DELIMITER ',';
COPY mark_color (code, description) FROM '/opt/data/seedData/data/luColor.csv' CSV HEADER DELIMITER ',';  -- TODO: confirm mark_color is luColor.csv
COPY body_part (code, description) FROM '/opt/data/seedData/data/luBodyPart.csv' CSV HEADER DELIMITER ',';
COPY specimen_type (code, description) FROM '/opt/data/seedData/data/luSpecimenType.csv' CSV HEADER DELIMITER ',';
COPY sub_sample_method (code, description) FROM '/opt/data/seedData/data/luSubSampleMethod.csv' CSV HEADER DELIMITER ',';
COPY unit (code, description) FROM '/opt/data/seedData/data/luUnit.csv' CSV HEADER DELIMITER ',';
COPY cone_debris_volume (code, description) FROM '/opt/data/seedData/data/luConeDebrisVolume.csv' CSV HEADER DELIMITER ',';

