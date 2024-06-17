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
}
