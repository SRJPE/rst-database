/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const { join } = require('path')
require('dotenv').config({ path: join(__dirname, '.env') })

exports.seed = async function (knex) {
  if (process.env.NODE_ENV !== 'development') {
    return
  }
  try {
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
    ])
  } catch (error) {
    throw error
  }
}
