require 'rails_helper'

RSpec.describe Activity do

  it 'has a record of the activities in the system' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1, id: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: 1)
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
