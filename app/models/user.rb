class User < ApplicationRecord
  has_many :rentals

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, on:create
  validates :password, presence: true, length: { minimum: 6 }
  validates :birth_date, presence: true
  validate :minimum_age_of_18

  private
  def minimum_age_of_18
    return if birth_date.blank?

    if birth_date + 18.years > Date.current
      errors.add(:birth_date, "must be at least 18 years ago")
    end
  end

end
