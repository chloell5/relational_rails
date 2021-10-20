require 'rails_helper'

RSpec.describe Activity do

  it 'has a record of the activities in the system' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)

    visit '/activities'
    expect(page).to have_content(activity_1.name)
    expect(page).to have_content(activity_1.day)
    expect(page).to have_content(activity_1.time)
    expect(page).to have_content(activity_1.max_number)
    expect(page).to have_content(activity_1.drop_in)
    expect(page).to have_content(activity_1.gym_id)
  end

  it 'only shows activities with a drop in of true' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
    activity_3 = Activity.create!(name: 'Cardio', day: 'Saturday', time: '10:15', max_number: 5, drop_in: false, gym_id: gym_1.id)

    expect(Activity.drop_in_true).to eq([activity_1, activity_2])
  end

  it 'shows a link that takes me to the activity edit page' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)

    visit '/activities'
    expect(page).to have_link('Edit Yoga')
    click_on 'Edit Yoga'
    expect(current_path).to eq("/activities/#{activity_1.id}/edit")
  end
end
