require 'rails_helper'

RSpec.describe Gym do

  it 'has a record of the gyms in the system' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    gym_2 = Gym.create!(name: 'Yoga Tonic', location: 'Salida', open: true, rank: 1)

    visit '/gyms'
    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_2.name)
    #save_and_open_page
  end

  it 'has a record of the activities in the system' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1, id: 1)
    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: '9:00', max_number: 15, drop_in: true, gym_id: 1)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: 1)



    visit '/activities'
    expect(page).to have_content(activity_1.name)
    expect(page).to have_content(activity_1.day)
    expect(page).to have_content(activity_1.time)
    expect(page).to have_content(activity_1.max_number)
    expect(page).to have_content(activity_1.drop_in)
    expect(page).to have_content(activity_1.gym_id)
    save_and_open_page
  end

end
