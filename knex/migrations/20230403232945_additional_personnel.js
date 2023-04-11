/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
  INSERT INTO
      personnel (
          first_name,
          last_name,
          email,
          phone,
          agency_id,
          role,
          orcid_id
      ) values
        ('Kassie', 'Hickey', 'Kassie.Hickey@water.ca.gov', '916-799-2547', 3, 'lead', null),
        ('Casey', 'Campos', 'Casey.Campos@water.ca.gov', '530-624-2748', 3, 'lead', null),
        ('Erin', 'Cain', 'ecain@flowwest.com', null, null, 'lead', null),
        ('Jordan', 'Hoang', 'jhoang@flowwest.com', null, null, 'lead', null),
        ('Hunter', 'Herrera', 'hherrera@flowwest.com', null, null, 'lead', null),
        ('Ben', 'Pintel', 'bpintel@flowwest.com', null, null, 'lead', null);
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DELETE FROM
      personnel
        WHERE
      email IN (
        'Kassie.Hickey@water.ca.gov',
        'Casey.Campos@water.ca.gov',
        'ecain@flowwest.com',
        'jhoang@flowwest.com',
        'hherrera@flowwest.com',
        'bpintel@flowwest.com'
      );
  `)
}
