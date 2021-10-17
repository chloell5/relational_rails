require 'rails_helper'

RSpec.describe 'Gym create' do
  it 'links to a new page from gym index' do
    visit '/gyms'
    click_link('New Gym')
    expect(current_path).to eq('/gyms/new')
  end

  it 'can create a new gym' do
    visit '/gyms/new'

    fill_in('Name', with: 'Fitness World')
    click_button('Create Gym')

    expect(current_path).to eq("/gyms")
    expect(page).to have_content("Fitness World")
  end

  it 'can create a new gym with attributes' do
    visit '/gyms/new'

    fill_in('Name', with: 'Fitness World')
    fill_in('Location', with: 'Colorado Springs')
    check 'Open'
    fill_in('Rank', with: 5)
    click_button('Create Gym')

    expect(current_path).to eq("/gyms")
    expect(page).to have_content("Fitness World")
    click_link("Fitness World")
    expect(page).to have_content("Colorado Springs")
    expect(page).to have_content(5)
  end

end
