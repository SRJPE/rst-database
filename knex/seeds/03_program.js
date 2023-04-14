/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('program').del()
  // seed program
  await knex('program').insert([
    {
      programName: 'Mill Creek RST Monitoring',
      streamName: 'Mill Creek',
      personnelLead: 1,
      fundingAgency: 2,
    },
    {
      programName: 'Deer Creek RST Monitoring',
      streamName: 'Deer Creek',
      personnelLead: 1,
      fundingAgency: 2,
    },
    {
      programName: 'Feather RST Monitoring',
      streamName: 'Feather River',
      personnelLead: 9,
      fundingAgency: 3,
    },
    {
      programName: 'Yuba River RST Monitoring',
      streamName: 'Yuba River',
      personnelLead: 10,
      fundingAgency: 3,
    },
    {
      programName: 'FlowWest Test Entry',
      streamName: 'FlowWest Test',
      personnelLead: 11,
      fundingAgency: null,
    },
  ])
}
