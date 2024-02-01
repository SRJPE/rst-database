/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const { join } = require('path')
require('dotenv').config({ path: join(__dirname, '.env') })

exports.seed = async function (knex) {
  // if (process.env.NODE_ENV === 'production') {
  //   return
  // }
  try {
    // Deletes ALL existing entries
    await knex('personnel').del()
    // seed personnel
    await knex('personnel').insert([
      {
        firstName: 'Ryan',
        lastName: 'Revnak',
        email: 'Ryan.Revnak@wildlife.ca.gov',
        agencyId: 2, // CDFWS
        role: 'lead',
        phone: '530-515-5422',
      },
      {
        firstName: 'Chanel',
        lastName: 'Somday',
        agencyId: 2,
        role: 'non-lead',
        phone: '509-207-0430',
        email: 'Chanel.Somday@wildlife.ca.gov',
      },
      {
        firstName: 'Ross',
        lastName: 'Schaefer',
        agencyId: 2,
        role: 'non-lead',
        phone: '805-975-7120',
        email: 'Ross.Schaefer@wildlife.ca.gov',
      },
      {
        firstName: 'Matt',
        lastName: 'Johnson',
        agencyId: 2,
        role: 'non-lead',
        email: 'Matt.Johnson@wildlife.ca.gov',
      },
      {
        firstName: 'Logan',
        lastName: 'Lenniger',
        agencyId: 2,
        role: 'non-lead',
        phone: '530-966-6641',
        email: 'Logan.Lenniger@wildlife.ca.gov',
      },
      {
        firstName: 'Michaela',
        lastName: 'Leyva',
        agencyId: 2,
        role: 'non-lead',
        phone: '408-603-0984',
        email: 'Michaela.Leyva@wildlife.ca.gov',
      },
      {
        firstName: 'Brian',
        lastName: 'Krempasky',
        agencyId: 2,
        role: 'non-lead',
        phone: '215-605-6949',
        email: 'Brian.Krempasky@wildlife.ca.gov',
      },
      {
        firstName: 'Sam',
        lastName: 'Funakoshi',
        agencyId: 2,
        role: 'non-lead',
        phone: '661-644-2136',
        email: 'Sam.Funakoshi@wildlife.ca.gov',
      },
      {
        firstName: 'Kassie',
        lastName: 'Hickey',
        agencyId: 3,
        role: 'lead',
        phone: '916-799-2547',
        email: 'Kassie.Hickey@water.ca.gov',
      },
      {
        firstName: 'Casey',
        lastName: 'Campos',
        agencyId: 3,
        role: 'lead',
        phone: '530-624-2748',
        email: 'Casey.Campos@water.ca.gov',
      },
      {
        firstName: 'Erin',
        lastName: 'Cain',
        agencyId: null,
        role: 'lead',
        phone: null,
        email: 'ecain@flowwest.com',
      },
      {
        firstName: 'Jordan',
        lastName: 'Hoang',
        agencyId: null,
        role: 'lead',
        phone: null,
        email: 'jhoang@flowwest.com',
      },
      {
        firstName: 'Hunter',
        lastName: 'Herrera',
        agencyId: null,
        role: 'lead',
        phone: null,
        email: 'hherrera@flowwest.com',
      },
      {
        firstName: 'Ben',
        lastName: 'Pintel',
        agencyId: null,
        role: 'lead',
        phone: null,
        email: 'bpintel@flowwest.com',
      },
      {
        firstName: 'Court',
        lastName: 'Fund',
        agencyId: 8, //PSMFC
        role: 'lead',
        phone: '559-978-5114',
        email: 'cfund@psmfc.org',
      },
      {
        firstName: 'Sofia',
        lastName: 'Markiewicz',
        agencyId: 8, //PSMFC
        role: 'non-lead',
        phone: '805-886-4282',
        email: 'smarkiewicz@psmfc.org',
      },
      {
        firstName: 'Emily',
        lastName: 'Barrier',
        agencyId: 8, //PSMFC
        role: 'non-lead',
        phone: '970-691-5882',
        email: 'ebarrier@psmfc.org',
      },
      {
        firstName: 'Blake',
        lastName: 'Ramaglia',
        agencyId: 8, //PSMFC
        role: 'non-lead',
      },
      {
        firstName: 'Tony',
        lastName: 'Yang',
        agencyId: 8,
        role: 'non-lead',
      },
      {
        firstName: 'Mitch',
        lastName: 'Barreras',
        agencyId: 8,
        role: 'non-lead',
      },
      {
        firstName: 'Dani',
        lastName: 'Hartwigsen',
        agencyId: 8,
        role: 'non-lead',
      },
    ])
  } catch (error) {
    throw error
  }
}
