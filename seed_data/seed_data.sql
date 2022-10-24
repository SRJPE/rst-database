-- for each lookup table copy command
COPY visit_type (definition)
FROM
  '/opt/data/seed_data/data/luVisitType.csv' CSV HEADER;

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
  '/opt/data/seed_data/data/luTaxon.csv' CSV HEADER;

COPY agency (definition)
FROM
  '/opt/data/seed_data/data/luAgency.csv' CSV HEADER;

COPY equipment (definition)
FROM
  '/opt/data/seed_data/data/luSampleGear.csv' CSV HEADER;

COPY trap_functionality (definition)
FROM
  '/opt/data/seed_data/data/luTrapFunctioning.csv' CSV HEADER;

COPY fish_processed (definition)
FROM
  '/opt/data/seed_data/data/luFishProcessed.csv' CSV HEADER;

COPY run (definition)
FROM
  '/opt/data/seed_data/data/luRun.csv' CSV HEADER;

COPY run_code_method (definition, description)
FROM
  '/opt/data/seed_data/data/luRunMethod.csv' CSV HEADER;

COPY life_stage (definition, description)
FROM
  '/opt/data/seed_data/data/luLifestage.csv' CSV HEADER;

COPY release_purpose (definition)
FROM
  '/opt/data/seed_data/data/luReleasePurpose.csv' CSV HEADER;

COPY mark_type (definition)
FROM
  '/opt/data/seed_data/data/luMarkType.csv' CSV HEADER;

COPY mark_color (definition)
FROM
  '/opt/data/seed_data/data/luColor.csv' CSV HEADER;

COPY body_part (definition)
FROM
  '/opt/data/seed_data/data/luBodyPart.csv' CSV HEADER;

COPY unit (definition)
FROM
  '/opt/data/seed_data/data/luUnit.csv' CSV HEADER;
