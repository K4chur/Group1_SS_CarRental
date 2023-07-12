class Car < ApplicationRecord
  has_many :rentals

  validates :brand, presence: true, length: { maximum: 255 }
  validates :model, presence: true, length: { maximum: 255 }
  validates :engine_capacity, presence: true, numericality: { greater_than: 0 }
  validates :fuel_type, presence: true, length: { maximum: 255 }
  validates :daily_price, presence: true, numericality: { greater_than: 0 }
  validates :fuel_consumption, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :img, presence: true

end
