class Activity < ApplicationRecord
  belongs_to :gym

  def self.drop_in_true
    where(drop_in: true)
  end

  def self.sort_alphabetically
    order(:name).pluck(:name)
  end

end

# scope :display, -> {
#     where(drop_in: true)
#   }
