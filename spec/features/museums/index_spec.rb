require 'rails_helper'

describe 'museums index page' do
  before(:each) do
    @museum = Museum.create!(
      name: 'The Louvre',
      free_admission: false,
      donation_revenue: 12345678
    )
    @museum2 = Museum.create!(
      name: 'MOMA',
      free_admission: true,
      donation_revenue: 7654321
    )

    visit '/museums'
  end

  it 'shows all museum names' do
    expect(page).to have_content(@museum.name)
    expect(page).to have_content(@museum2.name)
  end
end
