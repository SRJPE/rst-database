/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('permit_info').del()
  await knex('permit_info').insert([
    {
      permitId: 26021,
      programId: 1,
      streamName: 'Mill Creek',
      permitStartDate: '2022-01-01',
      permitEndDate: '2022-12-31',
      flowThreshold: 1000,
      temperatureThreshold: 16,
      frequencySamplingInclementWeather: 4,
      species: '161980.0',
      listingUnit: 1,
      fishLifeStage: 'juvenile',
      allowedExpectedTake: 1950,
      allowedMortalityCount: 10,
    },
    {
      permitId: 26021,
      programId: 2,
      streamName: 'Deer Creek',
      permitStartDate: '2022-01-01',
      permitEndDate: '2022-12-31',
      flowThreshold: 1000,
      temperatureThreshold: 16,
      frequencySamplingInclementWeather: 4,
      species: '161980.0',
      listingUnit: 1,
      fishLifeStage: 'juvenile',
      allowedExpectedTake: 1950,
      allowedMortalityCount: 10,
    },
  ])
}
