\COPY visit_type (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luVisitType.csv CSV HEADER
\COPY taxon (code, commonName, latinName, kingdomCommon, phylumCommon, classCommon, orderCommon, familyCommon, genusCommon, speciesCommon, subspeciesCommon, kingdomLatin, phylumLatin, classLatin, orderLatin, familyLatin, genusLatin, speciesLatin, subspeciesLatin) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luTaxon.csv CSV HEADER
\COPY agency (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luAgency.csv CSV HEADER
\COPY equipment (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luSampleGear.csv CSV HEADER
\COPY light_condition (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luLightCondition.csv CSV HEADER
\COPY trap_funcionality (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luTrapFunctioning.csv CSV HEADER
\COPY fish_processed (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luFishProcessed.csv CSV HEADER
\COPY run (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luRun.csv CSV HEADER
\COPY run_code_method (definition, description) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luRunMethod.csv CSV HEADER
\COPY life_stage (definition, description) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luLifestage.csv CSV HEADER
\COPY release_purpose (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luReleasePurpose.csv CSV HEADER
\COPY mark_type (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luMarkType.csv CSV HEADER
\COPY mark_color (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luColor.csv CSV HEADER
\COPY body_part (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luBodyPart.csv CSV HEADER
\COPY specimen_type (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luSpecimenType.csv CSV HEADER
\COPY sub_sample_method (definition, description) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luSubSampleMethod.csv CSV HEADER
\COPY unit (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luUnit.csv CSV HEADER
\COPY cone_debris_volume (definition) FROM /Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data/luConeDebrisVolume.csv CSV HEADER