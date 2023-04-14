/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  try {
    // Deletes ALL existing entries
    await knex('program_personnel_team').del()
    // seed program_personnel_team
    await knex('program_personnel_team').insert([
      { personnel_id: 1, program_id: 1 },
      { personnel_id: 1, program_id: 2 },
      { personnel_id: 2, program_id: 1 },
      { personnel_id: 2, program_id: 2 },
      { personnel_id: 3, program_id: 1 },
      { personnel_id: 3, program_id: 2 },
      { personnel_id: 4, program_id: 1 },
      { personnel_id: 4, program_id: 2 },
      { personnel_id: 5, program_id: 1 },
      { personnel_id: 5, program_id: 2 },
      { personnel_id: 6, program_id: 1 },
      { personnel_id: 6, program_id: 2 },
      { personnel_id: 7, program_id: 1 },
      { personnel_id: 7, program_id: 2 },
      { personnel_id: 8, program_id: 1 },
      { personnel_id: 8, program_id: 2 },
      { personnel_id: 9, program_id: 3 },
      { personnel_id: 10, program_id: 4 },
      { personnel_id: 11, program_id: 5 },
      { personnel_id: 12, program_id: 5 },
      { personnel_id: 13, program_id: 5 },
      { personnel_id: 14, program_id: 5 },
    ])
    
  } catch (error) {
    throw error
  }
}