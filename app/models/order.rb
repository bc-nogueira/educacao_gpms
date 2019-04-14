class Order < ApplicationRecord
  belongs_to :student

  has_many :course_orders, dependent: :delete_all
  has_many :courses, through: :course_orders

  enum situation: [:open, :closed]
end
