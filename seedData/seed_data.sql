-- for each lookup table copy command
COPY visit_type (code, definition) FROM '/opt/data/seedData/data/luVisitType.csv' CSV HEADER;
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
COPY agency (code, definition) FROM '/opt/data/seedData/data/luAgency.csv' CSV HEADER;
COPY equipment (code, definition) FROM '/opt/data/seedData/data/luSampleGear.csv' CSV HEADER;
COPY light_condition (code, definition) FROM '/opt/data/seedData/data/luLightCondition.csv' CSV HEADER;
COPY trap_funcionality (code, definition) FROM '/opt/data/seedData/data/luTrapFunctioning.csv' CSV HEADER;
COPY fish_processed (code, definition) FROM '/opt/data/seedData/data/luFishProcessed.csv' CSV HEADER;
COPY run (code, definition) FROM '/opt/data/seedData/data/luRun.csv' CSV HEADER;
COPY run_code_method (code, definition, description) FROM '/opt/data/seedData/data/luRunMethod.csv' CSV HEADER;
COPY life_stage (code, definition, description) FROM '/opt/data/seedData/data/luLifestage.csv' CSV HEADER;
COPY release_purpose (code, definition) FROM '/opt/data/seedData/data/luReleasePurpose.csv' CSV HEADER;
COPY mark_type (code, definition) FROM '/opt/data/seedData/data/luMarkType.csv' CSV HEADER;
COPY mark_color (code, definition) FROM '/opt/data/seedData/data/luColor.csv' CSV HEADER;  -- TODO: confirm mark_color is luColor.csv
COPY body_part (code, definition) FROM '/opt/data/seedData/data/luBodyPart.csv' CSV HEADER;
COPY specimen_type (code, definition) FROM '/opt/data/seedData/data/luSpecimenType.csv' CSV HEADER;
COPY sub_sample_method (code, definition, description) FROM '/opt/data/seedData/data/luSubSampleMethod.csv' CSV HEADER;
COPY unit (code, definition) FROM '/opt/data/seedData/data/luUnit.csv' CSV HEADER;
COPY cone_debris_volume (code, definition) FROM '/opt/data/seedData/data/luConeDebrisVolume.csv' CSV HEADER;

