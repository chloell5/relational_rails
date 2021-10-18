require 'rails_helper'

describe 'museums edit page' do
  it 'has forms for each attribute' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    visit "/museums/#{museum.id}/edit"

    fill_in 'name', with: 'Test Museum'
    check 'free_admission'
    fill_in 'donation_revenue', with: 1234

    click_button 'Update Museum'

    expect(page).to have_content('Test Museum')
    expect(page).to have_current_path("/museums/#{museum.id}")
  end
end
