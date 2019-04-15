class Order < ApplicationRecord
  belongs_to :student

  has_many :course_orders, dependent: :delete_all
  has_many :courses, through: :course_orders

  scope :closed, -> { where(situation: :closed) }

  enum situation: [:open, :closed]
end
