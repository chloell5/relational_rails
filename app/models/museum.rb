class Museum < ApplicationRecord
  has_many :compositions

  def count
    compositions.count
  end

  def self.order_created
    order(created_at: :desc)
  end
end
