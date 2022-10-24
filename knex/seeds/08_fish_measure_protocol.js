/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('fish_measure_protocol').del()
  await knex('fish_measure_protocol').insert([
    { programId: 1, species: '161980.0', run: 1, lifeStage: 3 },
    { programId: 1, species: '161980.0', run: 1, lifeStage: 4 },
    { programId: 1, species: '161980.0', run: 1, lifeStage: 8 },
    { programId: 2, species: '161980.0', run: 1, lifeStage: 3 },
    { programId: 2, species: '161980.0', run: 1, lifeStage: 4 },
    { programId: 2, species: '161980.0', run: 1, lifeStage: 8 },
  ])
}
