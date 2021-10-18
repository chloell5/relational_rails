class Museum < ApplicationRecord
  has_many :compositions

  def count
    compositions.count
  end

  def order_compositions
    compositions.order(:name)
  end

  def self.order_created
    order(created_at: :desc)
  end
end
