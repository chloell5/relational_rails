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
      donation_revenue: 7654321
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
end
