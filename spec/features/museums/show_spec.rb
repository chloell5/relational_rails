require 'rails_helper'

describe 'museums show page' do
  before(:each) do
    @museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )
    @museum2 = Museum.create!(
      name: 'MOMA',
      free_admission: true,
      donation_revenue: 7_654_321
    )
    Composition.create!(
      name: 'Mona Lisa',
      artist: 'da Vinci',
      on_display: true,
      year_made: 1503,
      museum_id: @museum.id
    )

    Composition.create!(
      name: 'The Starry Night',
      artist: 'van Gogh',
      on_display: true,
      year_made: 1889,
      museum_id: @museum.id
    )

    visit "/museums/#{@museum.id}"
  end

  it 'has museum attributes' do
    expect(page).to have_content(@museum.name)
    expect(page).to have_content("Free Admission?: #{@museum.free_admission}")
    expect(page).to have_content("Donation Revenue: $#{@museum.donation_revenue}")

    expect(page).to_not have_content(@museum2.name)
    expect(page).to_not have_content("Free Admission?: #{@museum2.free_admission}")
    expect(page).to_not have_content("Donation Revenue: $#{@museum2.donation_revenue}")
  end

  it 'shows a count of compositions at museum' do
    expect(page).to have_content('Compositions: 2')
  end

  it 'links to the museums compositions page' do
    click_on 'Museum Compositions'

    expect(page).to have_current_path("/museums/#{@museum.id}/compositions")
  end

  it 'links to the museums edit page' do
    click_on 'Update Museum'

    expect(page).to have_current_path("/museums/#{@museum.id}/edit")
  end
end
