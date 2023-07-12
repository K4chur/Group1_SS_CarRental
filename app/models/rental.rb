class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :car, presence: true
  validates :user, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true

  validate :date_to_after_date_from

  private
  def date_to_after_date_from
    return if date_to.blank? || date_from.blank?
    errors.add(:date_to, "must be after date_from") if date_to <= date_from
  end

end
