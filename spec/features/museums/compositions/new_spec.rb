require 'rails_helper'

describe 'museum compositions new page' do
  it 'has forms to create all attributes' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    visit "museums/#{museum.id}/compositions/new"

    fill_in 'name', with: 'Test Composition'
    fill_in 'artist', with: 'Test Artist'
    check 'on_display'
    fill_in 'year_made', with: 1234

    click_button 'Create Composition'

    expect(page).to have_content('Test Composition')
    expect(page).to have_current_path("/museums/#{museum.id}/compositions")
  end
end
