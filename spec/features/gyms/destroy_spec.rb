# As a visitor
# When I visit a gym show page
# Then I see a link to delete the gym
# When I click the link "Delete gym"
# Then a 'DELETE' request is sent to '/gyms/:id',
# the gym is deleted, and all activity records are deleted
# and I am redirected to the gym index page where I no longer see this gym

require 'rails_helper'

RSpec.describe 'destroy a gym' do
  it "can delete a gym from the gym's show page" do
    gym_1 = Gym.create!(name: 'Peak Fitness', location: 'Buena Vista', open: true, rank: 1)

    visit "/gyms/#{gym_1.id}"
    click_link "Delete #{gym_1.name}"

    expect(current_path).to eq('/gyms')
    expect(page).to_not have_content('Peak Fitness')

  end


end
