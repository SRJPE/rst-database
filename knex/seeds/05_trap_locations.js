/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('trap_locations').del()
  await knex('trap_locations').insert([
    {
      trapName: 'Mill Creek RST',
      programId: 1,
      dataRecorderId: 1,
      dataRecorderAgencyId: 2,
      siteName: 'Mill Creek RST',
      coneSizeFt: 5,
      xCoord: '40.05474',
      yCoord: '-122.029',
      gageNumber: 11381500,
      gageAgency: 9,
    },
    {
      trapName: 'Deer Creek RST',
      programId: 2,
      dataRecorderId: 1,
      dataRecorderAgencyId: 2,
      siteName: 'Deer Creek RST',
      coneSizeFt: 5,
      xCoord: '40.01097',
      yCoord: '-121.961',
      gageNumber: 11383500,
      gageAgency: 9,
    },
  ])
}
