class Order < ApplicationRecord
  belongs_to :student

  has_many :course_orders, dependent: :delete_all
  has_many :courses, through: :course_orders

  scope :closed, -> { where(situation: :closed) }

  enum situation: [:open, :closed]

  def total_price(discount)
    return courses.sum(&:price) if discount.nil?
    courses.sum { |course| course.discounted_price(discount.discount) }
  end
end
