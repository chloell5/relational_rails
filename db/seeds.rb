# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@museum = Museum.create!(
  name: 'The Louvre',
  free_admission: false,
  donation_revenue: 12345678
)
@museum2 = Museum.create!(
  name: 'MOMA',
  free_admission: true,
  donation_revenue: 7654321
)

@comp = Composition.create!(
  name: 'Mona Lisa',
  artist: 'da Vinci',
  on_display: true,
  year_made: 1503,
  museum_id: @museum.id
)

@comp2 = Composition.create!(
  name:'The Persistence of Memory',
  artist:'Dali',
  on_display: false,
  year_made: 1931,
  museum_id: @museum2.id
)

@comp3 = Composition.create!(
  name:'The Starry Night',
  artist:'van Gogh',
  on_display: true,
  year_made: 1889,
  museum_id: @museum2.id
)
