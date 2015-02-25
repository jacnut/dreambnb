# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([( name: 'Chicago' ), ( name: 'Copenhagen' )])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Flat.create(
  user_id: 1,
  name: 'Le bon lieu',
  city: 'Brussels',
  accomodates: '3',
  price: '65 EUR per night',
  has_AC: true,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 2,
  name: 'Au coeur de ville',
  city: 'Paris',
  accomodates: '2',
  price: '125 EUR per night',
  has_AC: false,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 3,
  name: 'The Bricks',
  city: 'London',
  accomodates: '4',
  price: '235 EUR per night',
  has_AC: true,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 2,
  name: 'Haile Selassie',
  city: 'Addis Abebea',
  accomodates: '2',
  price: '35 EUR per night',
  has_AC: true,
  has_jacuzzi: true,
)

Flat.create(
  user_id: 1,
  name: 'Brussels Delight',
  city: 'Brussels',
  accomodates: '2',
  price: '95 EUR per night',
  has_AC: false,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 3,
  name: 'Au tour Eiffel',
  city: 'Paris',
  accomodates: '3',
  price: '105 EUR per night',
  has_AC: false,
  has_jacuzzi: true,
)

Flat.create(
  user_id: 1,
  name: 'The Tower',
  city: 'London',
  accomodates: '8',
  price: '760 EUR per night',
  has_AC: true,
  has_jacuzzi: true,
)

Flat.create(
  user_id: 3,
  name: 'Tizeze',
  city: 'Addis Abebea',
  accomodates: '4',
  price: '95 EUR per night',
  has_AC: false,
  has_jacuzzi: true,
)

Flat.create(
  user_id: 2,
  name: 'Chez Fabien',
  city: 'Brussels',
  accomodates: '4',
  price: '105 EUR per night',
  has_AC: false,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 3,
  name: 'Chez Jaques',
  city: 'Brussels',
  accomodates: '2',
  price: '125 EUR per night',
  has_AC: false,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 3,
  name: 'Fox Place',
  city: 'London',
  accomodates: '1',
  price: '65 EUR per night',
  has_AC: false,
  has_jacuzzi: false,
)

Flat.create(
  user_id: 3,
  name: 'The Lions Den',
  city: 'Addis Abebea',
  accomodates: '2',
  price: '75 EUR per night',
  has_AC: false,
  has_jacuzzi: true,
)