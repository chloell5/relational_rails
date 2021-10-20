class Activity < ApplicationRecord
  belongs_to :gym

  def self.drop_in_true
    where(drop_in: true)
  end

  def self.sort_alphabetically
    order(:name)
  end

  scope :filter_by_max_number,
  lambda{|max_number| where('max_number > ?', max_number)}


end
