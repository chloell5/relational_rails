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

end
