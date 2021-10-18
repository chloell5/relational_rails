# User Story 12, gym Update (x2)
#
# As a visitor
# When I visit a gym show page
# Then I see a link to update the gym "Update gym"
# When I click the link "Update gym"
# Then I am taken to '/gyms/:id/edit' where I  see a form to edit the gym's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/gyms/:id',
# the gym's info is updated,
# and I am redirected to the gym's Show page where I see the gym's updated info
# [ ] done

require 'rails_helper'

RSpec.describe 'the gym update' do
  it 'links to the update page' do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)
    visit "/gyms/#{gym_1.id}"
    click_link "Update Gym"
    expect(current_path).to eq("/gyms/#{gym_1.id}/edit")
  end

  it 'can edit gym attributes' do
    gym_1 = Gym.create!(name: 'BV Peak Fitness', location: 'Buena Vista', open: true, rank: 1)

    visit "/gyms/#{gym_1.id}"
    expect(page).to have_content('BV Peak Fitness')
    click_link 'Update Gym'

    expect(current_path).to eq("/gyms/#{gym_1.id}/edit")
    fill_in 'name', with: 'Three Peaks Fitness'
    click_button 'Update Gym'

    expect(page).to have_content('Three Peaks Fitness')
  end

end
