/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.raw(`
    INSERT INTO
      trap_locations (
        trap_name,
        program_id,
        data_recorder_id,
        data_recorder_agency_id,
        site_name,
        cone_size_ft,
        x_coord,
        y_coord,
        coordinate_system,
        projection,
        datum,
        gage_number,
        gage_agency,
        comments
      ) values
        ('Steep Riffle RST', 4, 9, 3, 'Steep Riffle', 8, 39.4621, -121.604633, null, null, null, null, null, null),
        ('Steep Side Channel', 4, 9, 3, 'Steep Riffle', 8, 39.462014, -121.604028, null, null, null, null, null, null),
        ('Steep Riffle 10'' ext', 4, 9, 3, 'Steep Riffle', 8, 39.4621, -121.604633, null, null, null, null, null, null),
        ('Eye riffle north', 4, 9, 3, 'Steep Riffle', 8, 39.456597, -121.615317, null, null, null, null, null, null),
        ('Eye riffle Side Channel', 4, 9, 3, 'Steep Riffle', 8, 39.456233, -121.614508, null, null, null, null, null, null),
        ('Live Oak', 4, 9, 3, 'Live Oak', 8, 39.270811, -121.632636, null, null, null, null, null, null),
        ('Herringer east', 4, 9, 3, 'Herringer Riffle', 8, 39.315156, -121.625519, null, null, null, null, null, null),
        ('Herringer west', 4, 9, 3, 'Herringer Riffle', 8, 39.315156, -121.625519, null, null, null, null, null, null),
        ('Herringer Upper west', 4, 9, 3, 'Herringer Riffle', 8, 39.315156, -121.625519, null, null, null, null, null, null),
        ('Sunset East Bank', 4, 9, 3, 'Sunset Pumps', 8, 39.245658, -121.636425, null, null, null, null, null, null),
        ('Sunset West Bank', 4, 9, 3, 'Sunset Pumps', 8, 39.245658, -121.636425, null, null, null, null, null, null),
        ('Shawns East', 4, 9, 3, 'Shawns Beach', 8, 39.21215, -121.615411, null, null, null, null, null, null),
        ('Shawns West', 4, 9, 3, 'Shawns Beach', 8, 39.21215, -121.615411, null, null, null, null, null, null),
        ('Gateway main1', 4, 9, 3, 'Gateway Riffle', 8, 39.457069, -121.625161, null, null, null, null, null, null),
        ('Gateway Rootball', 4, 9, 3, 'Gateway Riffle', 8, 39.457069, -121.625161, null, null, null, null, null, null),
        ('Gateway Main 400'' Up River', 4, 9, 3, 'Gateway Riffle', 8, 39.457069, -121.625161, null, null, null, null, null, null),
        ('Gateway Rootball River Left', 4, 9, 3, 'Gateway Riffle', 8, 39.457069, -121.625161, null, null, null, null, null, null),
        ('Hallwood 1', 5, 10, 3, 'Hallwood', 8, 39.182161, -121.506503, null, null, null, null, null, null),
        ('Hallwood 2', 5, 10, 3, 'Hallwood', 8, 39.182161, -121.506503, null, null, null, null, null, null),
        ('FlowWest test 1', 6, 11, null, 'FlowWest Test', null, null, null, null, null, null, null, null, null),
        ('FlowWest test 2', 6, 11, null, 'FlowWest Test', null, null, null, null, null, null, null, null, null);
  `)
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.raw(`
    DELETE FROM
      trap_locations
    WHERE
      trap_name IN (
        'Steep Riffle RST',
        'Steep Side Channel',
        'Steep Riffle 10'' ext',
        'Eye riffle north',
        'Eye riffle Side Channel',
        'Live Oak',
        'Herringer east',
        'Herringer west',
        'Herringer Upper west',
        'Sunset East Bank',
        'Sunset West Bank',
        'Shawns East',
        'Shawns West',
        'Gateway main1',
        'Gateway Rootball',
        'Gateway Main 400'' Up River',
        'Gateway Rootball River Left',
        'Hallwood 1',
        'Hallwood 2',
        'FlowWest test 1',
        'FlowWest test 2'
      );
  `)
};
