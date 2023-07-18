class User < ApplicationRecord
  extend Devise::Models
  has_many :rentals

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :birth_date, presence: true
  validate :minimum_age_of_18
  validates :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def minimum_age_of_18
    return if birth_date.blank?

    if birth_date + 18.years > Date.current
      errors.add(:birth_date, "must be at least 18 years ago")
    end
  end
end
