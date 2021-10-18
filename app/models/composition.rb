class Composition < ApplicationRecord
  belongs_to :museum

  scope :over_year, lambda { |year_made| where('year_made >= ?',
    year_made) }
end
