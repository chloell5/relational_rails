# User Story 20, activity Delete (x2)
#
# As a visitor
# When I visit a activity show page
# Then I see a link to delete the activity "Delete activity"
# When I click the link
# Then a 'DELETE' request is sent to '/activity/:id',
# the activity is deleted,
# and I am redirected to the activity index page where I no longer see this activity

require 'rails_helper'

RSpec.describe 'destroy an activity' do
  it 'can delete an activity from the activities index page' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    time = Time.new(2021, 4, 2)

    activity_1 = Activity.create!(name: 'Yoga', day: 'Tuesday', time: time, max_number: 15, drop_in: true, gym_id: gym_1.id)
    activity_2 = Activity.create!(name: 'Intensity Train', day: 'Thursday', time: '8:15', max_number: 10, drop_in: true, gym_id: gym_1.id)

    visit '/activities'
    click_link "Delete #{activity_2.name}"
    expect(page).to_not have_content('Intensity Train')

  end
end
