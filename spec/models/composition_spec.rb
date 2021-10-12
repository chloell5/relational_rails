require 'rails_helper'

RSpec.describe Composition, type: :model do
  describe 'relationships' do
    it { should belong_to :museum }
  end
end
