\COPY visit_type (definition) FROM 'data/luVisitType.csv' CSV HEADER
\COPY taxon (code, commonName, latinName, kingdomCommon, phylumCommon, classCommon, orderCommon, familyCommon, genusCommon, speciesCommon, subspeciesCommon, kingdomLatin, phylumLatin, classLatin, orderLatin, familyLatin, genusLatin, speciesLatin, subspeciesLatin) FROM 'data/luTaxon.csv' CSV HEADER
\COPY agency (definition, description) FROM 'data/luAgency.csv' CSV HEADER
\COPY equipment (definition) FROM 'data/luEquipment.csv' CSV HEADER
\COPY trap_functionality (definition, description) FROM 'data/luTrapFunctionality.csv' CSV HEADER
\COPY fish_processed (definition, description) FROM 'data/luFishProcessed.csv' CSV HEADER
\COPY run (definition, description) FROM 'data/luRun.csv' CSV HEADER
\COPY run_code_method (definition, description) FROM 'data/luRunCodeMethod.csv' CSV HEADER
\COPY life_stage (definition, description) FROM 'data/luLifestage.csv' CSV HEADER
\COPY release_purpose (definition) FROM 'data/luReleasePurpose.csv' CSV HEADER
\COPY mark_type (definition) FROM 'data/luMarkType.csv' CSV HEADER
\COPY mark_color (definition) FROM 'data/luMarkColor.csv' CSV HEADER
\COPY body_part (definition) FROM 'data/luBodyPart.csv' CSV HEADER
\COPY unit (definition) FROM 'data/luUnit.csv' CSV HEADER
\COPY listing_unit (definition, associated_species, run) FROM 'data/luListingUnit.csv' CSV HEADER
\COPY frequency (definition) FROM 'data/luFrequency.csv' CSV HEADER
\COPY plus_count_methodology (definition, description) FROM 'data/luPlusCountMethodology.csv' CSV HEADER
\COPY trap_status_at_end (definition, description) FROM 'data/luTrapStatusAtEnd.csv' CSV HEADER
\COPY why_fish_not_processed (definition) FROM 'data/luWhyFishNotProcessed.csv' CSV HEADER
\COPY fish_condition (definition) FROM 'data/luFishCondition.csv' CSV HEADER
