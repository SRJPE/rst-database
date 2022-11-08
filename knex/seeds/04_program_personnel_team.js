/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries

  const allSeededPersonnel = await knex('personnel').select('id')

  const rowsToInsert = allSeededPersonnel.reduce(
    (previousArray, currentPersonnel) => {
      updatedArray = previousArray.concat([
        {
          personnelId: currentPersonnel.id,
          programId: 1,
        },
        {
          personnelId: currentPersonnel.id,
          programId: 2,
        },
      ])

      return updatedArray
    },
    []
  )

  await knex('program_personnel_team').del()
  // seed program_personnel_team
  await knex('program_personnel_team').insert(rowsToInsert)
}
