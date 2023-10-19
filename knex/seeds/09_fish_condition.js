/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('fish_condition').del()
  await knex('fish_condition').insert([
    { definition: 'dark coloration' },
    { definition: 'swimming abnormally' },
    { definition: 'bulging eyes' },
    { definition: 'pale gills' },
    { definition: 'bulging abdomen' },
    { definition: 'swollen/protruding vent' },
    { definition: 'bloody eye' },
    { definition: 'fungus' },
    { definition: 'none' },
  ])
  // Deletes ALL existing entries
  await knex('take_and_mortality').del()
  await knex('take_and_mortality').insert([
    {
      permitInfoId: 1,
      species: '161980',
      listingUnit: 1,
      fishLifeStage: 9,
      allowedExpectedTake: 1950,
      allowedMortalityCount: 10,
    },
    {
      permitInfoId: 2,
      species: '161980',
      listingUnit: 1,
      fishLifeStage: 9,
      allowedExpectedTake: 1950,
      allowedMortalityCount: 10,
    },
  ])
}
