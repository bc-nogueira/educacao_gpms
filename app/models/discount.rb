class Discount < ApplicationRecord
  include ActiveModel::Validations
  validates_with DiscountValidator

  validates :title, :discount, :start_date, :end_date, presence: true
  validates :title, uniqueness: true

  scope :active, -> {
    where(
        "(start_date <= :date AND end_date >= :date)",
        date: Time.zone.today
    )
  }
  scope :without_end, -> { where(end_date: nil) }
end
