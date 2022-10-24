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

COPY agency (definition, description)
FROM
  '/opt/data/seed_data/data/luAgency.csv' CSV HEADER;

COPY equipment (definition)
FROM
  '/opt/data/seed_data/data/luEquipment.csv' CSV HEADER;

COPY trap_functionality (definition, description)
FROM
  '/opt/data/seed_data/data/luTrapFunctionality.csv' CSV HEADER;

COPY fish_processed (definition, description)
FROM
  '/opt/data/seed_data/data/luFishProcessed.csv' CSV HEADER;

COPY run (definition, description)
FROM
  '/opt/data/seed_data/data/luRun.csv' CSV HEADER;

COPY run_code_method (definition, description)
FROM
  '/opt/data/seed_data/data/luRunCodeMethod.csv' CSV HEADER;

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
  '/opt/data/seed_data/data/luMarkColor.csv' CSV HEADER;

COPY body_part (definition)
FROM
  '/opt/data/seed_data/data/luBodyPart.csv' CSV HEADER;

COPY unit (definition)
FROM
  '/opt/data/seed_data/data/luUnit.csv' CSV HEADER;

COPY listing_unit (definition, associated_species, run)
FROM
  '/opt/data/seed_data/data/luListingUnit.csv' CSV HEADER;

COPY frequency (definition)
FROM
  '/opt/data/seed_data/data/luFrequency.csv' CSV HEADER;

COPY plus_count_methodology (definition, description)
FROM
  '/opt/data/seed_data/data/luPlusCountMethodology.csv' CSV HEADER;

COPY trap_status_at_end (definition, description)
FROM
  '/opt/data/seed_data/data/luTrapStatusAtEnd.csv' CSV HEADER;

COPY why_fish_not_processed (definition)
FROM
  '/opt/data/seed_data/data/luWhyFishNotProcessed.csv' CSV HEADER;

COPY why_trap_not_functioning (definition)
FROM
  '/opt/data/seed_data/data/luWhyTrapNotFunctioning.csv' CSV HEADER;