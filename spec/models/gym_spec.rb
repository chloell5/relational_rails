require 'rails_helper'

RSpec.describe Gym, type: :model do
  describe 'relationships' do
    it {should have_many :activities}
  end
  
end
