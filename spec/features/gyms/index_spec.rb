require 'rails_helper'

RSpec.describe Gym do

it 'has a record of the gyms in the system' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    gym_2 = Gym.create!(name: 'Yoga Tonic', location: 'Salida', open: true, rank: 1)

    visit '/gyms'
    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_2.name)
    save_and_open_page
  end

  it 'can return gyms in order of most recently created' do
    time_1 = Time.new(2020, 02, 24, 12, 0, 0, "+09:00")
    time_2 = Time.new(2021, 05, 16, 12, 0, 0, "+10:00")

    gym_1 = FactoryBot.create(:gym, created_at: time_1)
    gym_2 = FactoryBot.create(:gym, created_at: time_2)

    visit '/gyms'

    expect(gym_2.name).to appear_before(gym_1.name)
    end


end
