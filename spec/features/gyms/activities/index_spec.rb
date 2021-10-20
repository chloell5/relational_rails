require 'rails_helper'

RSpec.describe Gym do

  it 'has a record of the activities associate with the gym' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)

    visit "/gyms/#{gym_1.id}/activities"

    expect(page).to have_content(activity_1.name)

  end

  it 'has a link to order activities alphabetically' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
    activity_3 = Activity.create!(name: 'Cardio', day: 'Saturday', time: '10:15', max_number: 5, drop_in: false, gym_id: gym_1.id)

    visit "/gyms/#{gym_1.id}/activities"

    expect(page).to have_link('Alphabetize Activities')
  end

  it 'can sort activities alphabetically' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
    activity_3 = Activity.create!(name: 'Cardio', day: 'Saturday', time: '10:15', max_number: 5, drop_in: false, gym_id: gym_1.id)
    visit "/gyms/#{gym_1.id}/activities"
    click_on 'Alphabetize Activities'
    expect(activity_3.name).to appear_before(activity_2.name)
    expect(activity_2.name).to appear_before(activity_1.name)
  end

  it 'can filter by maximum number' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)
    activity_3 = Activity.create!(name: 'Cardio', day: 'Saturday', time: '10:15', max_number: 5, drop_in: false, gym_id: gym_1.id)

    visit "/gyms/#{gym_1.id}/activities"
    fill_in 'max_num', with:6
    click_button 'Submit'
    expect(page).to have_content(activity_1.name)
    expect(page).to have_content(activity_2.name)
    expect(page).to_not have_content(activity_3.name)

  end

end
