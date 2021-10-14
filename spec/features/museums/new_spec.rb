require 'rails_helper'

describe 'museums show page' do
  it 'has forms for each attribute' do
    visit '/museums/new'

    fill_in 'name', with: 'Test Museum'
    check 'free_admission'
    fill_in 'donation_revenue', with: 1234

    click_button 'Create Museum'
  end
end
