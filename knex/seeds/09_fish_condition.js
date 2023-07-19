/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('fish_condition').del()
  await knex('fish_condition').insert([
    { id: 1, definition: 'dark coloration' },
    { id: 2, definition: 'swimming abnormally' },
    { id: 3, definition: 'bulging eyes' },
    { id: 4, definition: 'pale gills' },
    { id: 5, definition: 'bulging abdomen' },
    { id: 6, definition: 'swollen/protruding vent' },
    { id: 7, definition: 'bloody eye' },
    { id: 8, definition: 'fungus' },
    { id: 9, definition: 'none' },
  ])
}
