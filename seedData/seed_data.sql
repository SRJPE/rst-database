-- for each lookup table copy command
COPY visit_type (definition)
FROM
  '/opt/data/seedData/data/luVisitType.csv' CSV HEADER;

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
)
FROM
  '/opt/data/seedData/data/luTaxon.csv' CSV HEADER;

COPY agency (definition)
FROM
  '/opt/data/seedData/data/luAgency.csv' CSV HEADER;

COPY equipment (definition)
FROM
  '/opt/data/seedData/data/luSampleGear.csv' CSV HEADER;

COPY light_condition (definition)
FROM
  '/opt/data/seedData/data/luLightCondition.csv' CSV HEADER;

COPY trap_funcionality (definition)
FROM
  '/opt/data/seedData/data/luTrapFunctioning.csv' CSV HEADER;

COPY fish_processed (definition)
FROM
  '/opt/data/seedData/data/luFishProcessed.csv' CSV HEADER;

COPY run (definition)
FROM
  '/opt/data/seedData/data/luRun.csv' CSV HEADER;

COPY run_code_method (definition, description)
FROM
  '/opt/data/seedData/data/luRunMethod.csv' CSV HEADER;

COPY life_stage (definition, description)
FROM
  '/opt/data/seedData/data/luLifestage.csv' CSV HEADER;

COPY release_purpose (definition)
FROM
  '/opt/data/seedData/data/luReleasePurpose.csv' CSV HEADER;

COPY mark_type (definition)
FROM
  '/opt/data/seedData/data/luMarkType.csv' CSV HEADER;

COPY mark_color (definition)
FROM
  '/opt/data/seedData/data/luColor.csv' CSV HEADER;

COPY body_part (definition)
FROM
  '/opt/data/seedData/data/luBodyPart.csv' CSV HEADER;

COPY specimen_type (definition)
FROM
  '/opt/data/seedData/data/luSpecimenType.csv' CSV HEADER;

COPY sub_sample_method (definition, description)
FROM
  '/opt/data/seedData/data/luSubSampleMethod.csv' CSV HEADER;

COPY unit (definition)
FROM
  '/opt/data/seedData/data/luUnit.csv' CSV HEADER;

COPY cone_debris_volume (definition)
FROM
  '/opt/data/seedData/data/luConeDebrisVolume.csv' CSV HEADER;