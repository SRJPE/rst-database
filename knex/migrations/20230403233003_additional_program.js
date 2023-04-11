/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.raw(`
    INSERT INTO
      program (
          program_name, 
          stream_name, 
          personnel_lead, 
          funding_agency, 
          efficiency_protocols_document_link, 
          trapping_protocols_document_link
      ) values
        ('DELETED', null, null, null, null, null),
        ('Feather RST Monitoring', 'Feather River', 9, 3, null, null),
        ('Yuba River RST Monitoring', 'Yuba River', 10, 3, null, null),
        ('FlowWest Test Entry', 'FlowWest Test', 11, null, null, null);
  `)
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.raw(`
  DELETE FROM
    program
  WHERE
    program_name IN (
        'DELETED',
        'Feather RST Monitoring',
        'Yuba River RST Monitoring',
        'FlowWest Test Entry'
    );
  `)
};
