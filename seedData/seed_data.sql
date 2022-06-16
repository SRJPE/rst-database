-- for each lookup table copy command
COPY visit_type (code, description) FROM '/opt/data/seedData/data/luVisitType.csv' CSV HEADER;
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
) FROM '/opt/data/seedData/data/luTaxon.csv' CSV HEADER;
COPY agency (code, description) FROM '/opt/data/seedData/data/luAgency.csv' CSV HEADER;
COPY equipment (code, description) FROM '/opt/data/seedData/data/luSampleGear.csv' CSV HEADER;
COPY light_condition (code, description) FROM '/opt/data/seedData/data/luLightCondition.csv' CSV HEADER;
COPY trap_funcionality (code, description) FROM '/opt/data/seedData/data/luTrapFunctioning.csv' CSV HEADER;
COPY fish_processed (code, description) FROM '/opt/data/seedData/data/luFishProcessed.csv' CSV HEADER;
COPY run (code, description) FROM '/opt/data/seedData/data/luRun.csv' CSV HEADER;
COPY run_code_method (code, description) FROM '/opt/data/seedData/data/luRunMethod.csv' CSV HEADER;
COPY life_stage (code, description) FROM '/opt/data/seedData/data/luLifestage.csv' CSV HEADER;
COPY release_purpose (code, description) FROM '/opt/data/seedData/data/luReleasePurpose.csv' CSV HEADER;
COPY fish_origin (code, description) FROM '/opt/data/seedData/data/luFishOrigin.csv' CSV HEADER;
COPY mark_type (code, description) FROM '/opt/data/seedData/data/luMarkType.csv' CSV HEADER;
COPY mark_color (code, description) FROM '/opt/data/seedData/data/luColor.csv' CSV HEADER;  -- TODO: confirm mark_color is luColor.csv
COPY body_part (code, description) FROM '/opt/data/seedData/data/luBodyPart.csv' CSV HEADER;
COPY specimen_type (code, description) FROM '/opt/data/seedData/data/luSpecimenType.csv' CSV HEADER;
COPY sub_sample_method (code, description) FROM '/opt/data/seedData/data/luSubSampleMethod.csv' CSV HEADER;
COPY unit (code, description) FROM '/opt/data/seedData/data/luUnit.csv' CSV HEADER;
COPY cone_debris_volume (code, description) FROM '/opt/data/seedData/data/luConeDebrisVolume.csv' CSV HEADER;

