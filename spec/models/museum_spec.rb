require 'rails_helper'

RSpec.describe Museum, type: :model do
  describe 'relationships' do
    it { should have_many :compositions }
  end
end
