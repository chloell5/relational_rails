require 'rails_helper'

RSpec.describe "Activities show page" do

  it 'can show the activity by id and show attributes' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1, id: 1)
    gym_2 = Gym.create!(name: 'Yoga Tonic', location: 'Salida', open: true, rank: 1)

    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: 1)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: 1)

    visit "/activities/#{activity_1.id}"
    expect(page).to have_content(activity_1.name)
    expect(page).to have_content(activity_1.day)
    expect(page).to have_content(activity_1.time)
    expect(page).to have_content(activity_1.max_number)
    expect(page).to have_content(activity_1.drop_in)
    expect(page).to have_content(activity_1.gym_id)

    expect(page).to_not have_content(activity_2.name)
    expect(page).to_not have_content(activity_2.day)
    expect(page).to_not have_content(activity_2.time)

    save_and_open_page
  end



end
