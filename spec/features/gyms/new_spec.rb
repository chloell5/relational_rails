# User Story 11, gym Creation (x2)
#
# As a visitor
# When I visit the gym Index page
# Then I see a link to create a new gym record, "New gym"
# When I click this link
# Then I am taken to '/gyms/new' where I  see a form for a new gym record
# When I fill out the form with a new gym's attributes:
# And I click the button "Create gym" to submit the form
# Then a `POST` request is sent to the '/gyms' route,
# a new gym record is created,
# and I am redirected to the gym Index page where I see the new gym displayed.

require 'rails_helper'

RSpec.describe 'Gym create' do
  it 'links to a new page from artist index' do
    visit '/gyms'
    click_link('New Gym')
    expect(current_path).to eq('/gyms/new')
  end

  it 'can create a new artist' do
    visit '/gyms/new'

    fill_in('Name', with: 'Fitness World')
    click_button('Create Gym')

    expect(current_path).to eq("/gyms")
    expect(page).to have_content("Fitness World")
  end

end
