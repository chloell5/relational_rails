require 'rails_helper'

RSpec.describe Gym do

  it 'has a record of the gyms in the system' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    gym_2 = Gym.create!(name: 'Yoga Tonic', location: 'Salida', open: true, rank: 1)

    visit '/gyms'
    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_2.name)
  end

  it 'can return gyms in order of most recently created' do
    time_1 = Time.new(2020, 02, 24, 12, 0, 0, "+09:00")
    time_2 = Time.new(2021, 05, 16, 12, 0, 0, "+10:00")

    gym_1 = FactoryBot.create(:gym, created_at: time_2)
    gym_2 = FactoryBot.create(:gym, created_at: time_1)

    visit '/gyms'
    expect(gym_1.name).to appear_before(gym_2.name)
  end

  it 'shows a link that takes me to activity index' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
    visit "/gyms/#{gym_1.id}"
    expect(page).to have_link("Gym Activities")
    click_on "Gym Activities"
    expect(current_path).to eq("/gyms/#{gym_1.id}/activities")
  end

  it 'shows a link that takes me to the gym edit page' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
    visit '/gyms/'
    expect(page).to have_link('Edit Peak Fitness')
    click_on 'Edit Peak Fitness'
    expect(current_path).to eq("/gyms/#{gym_1.id}/edit")
  end

end
