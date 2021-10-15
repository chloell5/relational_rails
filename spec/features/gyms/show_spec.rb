require 'rails_helper'

RSpec.describe "Gyms show page" do

  it 'can show the gym, id, and attributes' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    gym_2 = Gym.create!(name: 'Yoga Tonic', location: 'Salida', open: true, rank: 1)

    visit "/gyms/#{gym_1.id}"
    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_1.location)
    expect(page).to have_content(gym_1.open)
    expect(page).to have_content(gym_1.rank)

    expect(page).to_not have_content(gym_2.name)
    expect(page).to_not have_content(gym_2.location)
    save_and_open_page
  end



end
