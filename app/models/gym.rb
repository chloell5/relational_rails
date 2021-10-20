class Gym < ApplicationRecord
  has_many :activities

  # def filter_by_max_number(num)
  #   activities.where("max_number > #{num}")
  # end

end
