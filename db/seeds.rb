# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'factory_bot_rails'

#Gym.destroy_all
3.times do
  FactoryBot.create(:gym)
end

5.times do
  FactoryBot.create(:activity)
end

@museum = Museum.create!(
  name: 'The Louvre',
  free_admission: false,
  donation_revenue: 12_345_678
)

@museum2 = Museum.create!(
  name: 'MOMA',
  free_admission: true,
  donation_revenue: 7_654_321
)

@museum3 = Museum.create!(
  name: 'State Hermitage Museum',
  free_admission: true,
  donation_revenue: 765_432
)

@comp = Composition.create!(
  name: 'Mona Lisa',
  artist: 'da Vinci',
  on_display: true,
  year_made: 1503,
  museum_id: @museum.id
)

@comp2 = Composition.create!(
  name: 'The Persistence of Memory',
  artist: 'Dali',
  on_display: false,
  year_made: 1931,
  museum_id: @museum2.id
)

@comp3 = Composition.create!(
  name: 'The Starry Night',
  artist: 'van Gogh',
  on_display: true,
  year_made: 1889,
  museum_id: @museum.id
)

@comp4 = Composition.create!(
  name: 'The Boulevard Montmarte in Paris',
  artist: 'Pissarro',
  on_display: false,
  year_made: 1897,
  museum_id: @museum3.id
)

@comp5 = Composition.create!(
  name: 'Thatched Cottages and Houses',
  artist: 'van Gogh',
  on_display: true,
  year_made: 1890,
  museum_id: @museum3.id
)

@comp6 = Composition.create!(
  name: 'The Return of the Prodigal Son',
  artist: 'Rembrandt',
  on_display: true,
  year_made: 1889,
  museum_id: @museum3.id
)
