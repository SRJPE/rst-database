/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.raw(`
    INSERT INTO 
      release_site (
        trap_locations_id,
        release_site_name,
        release_site_x_coord,
        release_site_y_coord,
        release_site_coordinate_system,
        release_site_datum,
        release_site_projection
      ) values
        (3, 'Steep Riffle Release Site', null, null, null, null, null),
        (4, 'Steep Riffle Release Site', null, null, null, null, null),
        (5, 'Steep Riffle Release Site', null, null, null, null, null),
        (6, 'Eye Riffle Release Site', null, null, null, null, null),
        (7, 'Eye Riffle Release Site', null, null, null, null, null),
        (8, 'Live Oak Release Site', null, null, null, null, null),
        (9, 'Herringer Riffle Release Site', null, null, null, null, null),
        (10, 'Herringer Riffle Release Site', null, null, null, null, null),
        (11, 'Herringer Riffle Release Site', null, null, null, null, null),
        (12, 'Sunset Pumps Release Site', null, null, null, null, null),
        (13, 'Sunset Pumps Release Site', null, null, null, null, null),
        (14, 'Shawns Beach Release Site', null, null, null, null, null),
        (15, 'Shawns Beach Release Site', null, null, null, null, null),
        (16, 'Gateway Riffle Release Site', null, null, null, null, null),
        (17, 'Gateway Riffle Release Site', null, null, null, null, null),
        (18, 'Gateway Riffle Release Site', null, null, null, null, null),
        (19, 'Gateway Riffle Release Site', null, null, null, null, null),
        (20, 'Hallwood Release Site', null, null, null, null, null),
        (21, 'Hallwood Release Site', null, null, null, null, null),
        (22, 'FlowWest Test Release Site', null, null, null, null, null),
        (23, 'FlowWest Test Release Site', null, null, null, null, null);
  `)
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.raw(`
    DELETE FROM
      release_site
    WHERE
      release_site_name IN (
        'Steep Riffle Release Site',
        'Eye Riffle Release Site',
        'Live Oak Release Site',
        'Herringer Riffle Release Site',
        'Sunset Pumps Release Site',
        'Shawns Beach Release Site',
        'Gateway Riffle Release Site',
        'Hallwood Release Site',
        'FlowWest Test Release Site'
      );
  `)
};
