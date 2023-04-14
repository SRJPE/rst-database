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
    {
      trapLocationsId: 3,
      releaseSiteName: 'Steep Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 4,
      releaseSiteName: 'Steep Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 5,
      releaseSiteName: 'Steep Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 6,
      releaseSiteName: 'Eye Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 7,
      releaseSiteName: 'Eye Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 8,
      releaseSiteName: 'Live Oak Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 9,
      releaseSiteName: 'Herringer Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 10,
      releaseSiteName: 'Herringer Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 11,
      releaseSiteName: 'Herringer Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 12,
      releaseSiteName: 'Sunset Pumps Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 13,
      releaseSiteName: 'Sunset Pumps Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 14,
      releaseSiteName: 'Shawns Beach Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 15,
      releaseSiteName: 'Shawns Beach Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 16,
      releaseSiteName: 'Gateway Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 17,
      releaseSiteName: 'Gateway Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 18,
      releaseSiteName: 'Gateway Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 19,
      releaseSiteName: 'Gateway Riffle Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 20,
      releaseSiteName: 'Hallwood Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 21,
      releaseSiteName: 'Hallwood Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 22,
      releaseSiteName: 'FlowWest Test Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
    {
      trapLocationsId: 23,
      releaseSiteName: 'FlowWest Test Release Site',
      release_site_x_coord: null,
      release_site_y_coord: null,
    },
  ])
}
