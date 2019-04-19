class Discount < ApplicationRecord
  scope :active, -> {
    where(
        "(start_date <= :date AND end_date >= :date)",
        date: Time.zone.today
    )
  }
end
