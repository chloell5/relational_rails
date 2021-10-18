# User Story 13, gym activity Creation (x2)
#
# As a visitor
# When I visit a gym activitys Index page
# Then I see a link to add a new adoptable activity for that gym "Create activity"
# When I click the link
# I am taken to '/gyms/:gym_id/activity/new' where I see a form to add a new adoptable activity
# When I fill in the form with the activity's attributes:
# And I click the button "Create activity"
# Then a `POST` request is sent to '/gyms/:gym_id/activity_table_name',
# a new activity object/row is created for that gym,
# and I am redirected to the gym activitys Index page where I can see the new activity listed
# [ ] done

require 'rails_helper'

RSpec.describe 'New Activity' do

  it 'links to a new page from gym_activities index' do

    gym = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1, id: 1)

    visit "/gyms/#{gym.id}/activities"

    click_link('New Activity')
    expect(current_path).to eq("/gyms/#{gym.id}/activities/new")
  end

  it 'can create a new activity attributes' do
    gym = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1, id: 1)

    visit "/gyms/#{gym.id}/activities/new"

    fill_in('Name', with: 'Weight Lifting')
    fill_in('Day', with: 'Wednesday')
    fill_in('Time', with: '5:00')
    fill_in('max_number', with: 10)
    check 'drop_in'

    click_button('Create Activity')
    expect(page).to have_content("Weight Lifting")
  end

end
