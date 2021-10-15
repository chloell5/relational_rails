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



end
