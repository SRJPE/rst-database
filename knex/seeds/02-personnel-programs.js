/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const { join } = require('path')
require('dotenv').config({ path: join(__dirname, '.env') })

exports.seed = async function (knex) {
  if (process.env.NODE_ENV !== 'development') {
    return
  }
  try {
    // Deletes ALL existing entries
    await knex('program_personnel_team').del()
    await knex('trap_locations').del()
    await knex('personnel').del()
    await knex('program').del()

    // seed personnel
    const seededUser = await knex('personnel').insert(
      [
        {
          firstName: 'Ryan',
          lastName: 'Revnak',
          email: 'Ryan.Revnak@wildlife.ca.gov',
          agencyId: 2, // CDFW
          role: 'LEAD',
        },
      ],
      ['id']
    )

    // seed program
    const seededPrograms = await knex('program').insert(
      [
        {
          programName: 'Mill Creek RST Monitoring',
          streamName: 'Mill Creek',
          personnelLead: seededUser[0].id,
          fundingAgency: 2,
        },
        {
          programName: 'Deer Creek RST Monitoring',
          streamName: 'Deer Creek',
          personnelLead: seededUser[0].id,
          fundingAgency: 2,
        },
      ],
      ['id']
    )

    // seed program_personnel_team
    await knex('program_personnel_team').insert([
      {
        personnelId: seededUser[0].id,
        programId: seededPrograms[0].id,
      },
      {
        personnelId: seededUser[0].id,
        programId: seededPrograms[1].id,
      },
    ])

    // seed program
    const seededTrapLocations = await knex('trap_locations').insert(
      [
        {
          trapName: 'Mill Creek RST',
          programId: seededPrograms[0].id,
          dataRecorderId: seededUser[0].id,
          dataRecorderAgencyId: 2,
          coneSizeFt: 5,
          xCoord: '40.05474',
          yCoord: '-122.029',
        },
        {
          trapName: 'Deer Creek RST',
          programId: seededPrograms[1].id,
          dataRecorderId: seededUser[0].id,
          dataRecorderAgencyId: 2,
          coneSizeFt: 5,
          xCoord: '40.01097',
          yCoord: '-121.961',
        },
      ],
      ['id']
    )
  } catch (error) {
    throw error
  }
}
