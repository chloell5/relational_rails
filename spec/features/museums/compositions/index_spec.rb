require 'rails_helper'

describe 'museum compositions index page' do
  it 'has museum composition attributes' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )
    museum2 = Museum.create!(
      name: 'MOMA',
      free_admission: true,
      donation_revenue: 7_654_321
    )

    comp = Composition.create!(
      name: 'Mona Lisa',
      artist: 'da Vinci',
      on_display: true,
      year_made: 1503,
      museum_id: museum.id
    )

    comp2 = Composition.create!(
      name: 'The Persistence of Memory',
      artist: 'Dali',
      on_display: false,
      year_made: 1931,
      museum_id: museum2.id
    )

    visit "/museums/#{museum.id}/compositions"

    expect(page).to have_content(museum.name)
    expect(page).to have_content(comp.name)
    expect(page).to have_content("Artist: #{comp.artist}")
    expect(page).to have_content("On Display?: #{comp.on_display}")
    expect(page).to have_content("Year Made: #{comp.year_made}")

    expect(page).to_not have_content(museum2.name)
    expect(page).to_not have_content(comp2.name)
    expect(page).to_not have_content("Artist: #{comp2.artist}")
    expect(page).to_not have_content("On Display?: #{comp2.on_display}")
    expect(page).to_not have_content("Year Made: #{comp2.year_made}")
  end

  it 'has link for new composition' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    visit "/museums/#{museum.id}/compositions"

    click_link 'New Composition'

    expect(page).to have_current_path("/museums/#{museum.id}/compositions/new")
  end

  it 'has alphabetize functionality' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    comp = Composition.create!(
      name: 'The Starry Night',
      artist: 'van Gogh',
      on_display: true,
      year_made: 1889,
      museum_id: museum.id
    )

    comp2 = Composition.create!(
      name: 'Mona Lisa',
      artist: 'da Vinci',
      on_display: true,
      year_made: 1503,
      museum_id: museum.id
    )

    comp3 = Composition.create!(
      name: 'The Persistence of Memory',
      artist: 'Dali',
      on_display: true,
      year_made: 1931,
      museum_id: museum.id
    )

    visit "/museums/#{museum.id}/compositions"

    click_on 'Sort Alphabetically by Name'

    expect(comp2.name).to appear_before(comp3.name)
    expect(comp3.name).to appear_before(comp.name)
  end

  it 'has filtering for year created' do
    museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12_345_678
    )

    comp = Composition.create!(
      name: 'The Starry Night',
      artist: 'van Gogh',
      on_display: true,
      year_made: 1889,
      museum_id: museum.id
    )

    comp2 = Composition.create!(
      name: 'The Boulevard Montmarte in Paris',
      artist: 'Pissarro',
      on_display: false,
      year_made: 1897,
      museum_id: museum.id
    )

    comp3 = Composition.create!(
      name: 'Thatched Cottages and Houses',
      artist: 'van Gogh',
      on_display: true,
      year_made: 1890,
      museum_id: museum.id
    )

    comp4 = Composition.create!(
      name: 'The Return of the Prodigal Son',
      artist: 'Rembrandt',
      on_display: true,
      year_made: 1889,
      museum_id: museum.id
    )

    visit "/museums/#{museum.id}/compositions"

    fill_in 'earliest_year_made', with: 1890

    click_button 'Apply'

    expect(page).to have_content(comp2.name)
    expect(page).to have_content(comp3.name)

    expect(page).to_not have_content(comp.name)
    expect(page).to_not have_content(comp4.name)
  end
end
