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

  end

  it 'counts the number of activities associate with the gym' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)

    visit "/gyms/#{gym_1.id}"
    expect(page).to have_content("Number of Activities: 2")
  end



end
