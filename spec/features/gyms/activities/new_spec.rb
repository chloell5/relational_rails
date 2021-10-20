
require 'rails_helper'

RSpec.describe 'New Activity' do

  it 'links to a new page from gym_activities index' do

    gym = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)

    visit "/gyms/#{gym.id}/activities"

    click_link('New Activity')
    expect(current_path).to eq("/gyms/#{gym.id}/activities/new")
  end

  it 'can create a new activity attributes' do
    gym = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)

    visit "/gyms/#{gym.id}/activities/new"

    fill_in('Name', with: 'Weight Lifting')
    fill_in('Day', with: 'Wednesday')
    fill_in('Time', with: '5:00')
    fill_in('max_number', with: 10)
    check 'drop_in'

    click_button('Create Activity')
    expect(page).to have_content("Weight Lifting")
  end

end
