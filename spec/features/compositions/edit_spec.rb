require 'rails_helper'

describe 'compositions edit page' do
  it 'has forms for each attribute' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    comp = Composition.create!(
      name: 'Mona Lisa',
      artist: 'da Vinci',
      on_display: true,
      year_made: 1503,
      museum_id: museum.id
    )

    visit "/compositions/#{comp.id}/edit"

    fill_in 'name', with: 'Test Composition'
    fill_in 'artist', with: 'Test Artist'
    fill_in 'year_made', with: 1234

    click_button 'Update Composition'

    expect(page).to have_content('Test Composition')
    expect(page).to have_current_path("/compositions/#{comp.id}")
  end
end
