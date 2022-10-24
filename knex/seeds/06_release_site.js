/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = async function (knex) {
  // Deletes ALL existing entries
  await knex('release_site').del()
  await knex('release_site').insert([
    {
      trapLocationsId: 1,
      releaseSiteName: 'Mill Creek Release Site',
      release_site_x_coord: '40.05474',
      release_site_y_coord: '-122.0101',
    },
    {
      trapLocationsId: 2,
      releaseSiteName: 'Deer Creek Release Site',
      release_site_x_coord: '40.00434',
      release_site_y_coord: '-122.5718',
    },
  ])
}
