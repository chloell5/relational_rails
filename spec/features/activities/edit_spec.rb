
require 'rails_helper'

RSpec.describe 'the activity update' do
  it 'can update activity attributes' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)

    time = Time.new(2021, 4, 2)
    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)

    visit "/activities/#{activity_1.id}/edit"

    fill_in 'name', with: 'Pilates'
    click_button 'Update Activity'
    expect(page).to have_content('Pilates')
  end
end
