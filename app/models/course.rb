class Course < ApplicationRecord
  belongs_to :teacher

  has_many :course_ratings
  has_many :course_orders
  has_many :lessons
  has_many :notifications
  has_many :orders, through: :course_orders
  has_many :wishes

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :students

  scope :by_name_like, ->(name) do
    where('LOWER(name) LIKE ?', "%#{name.downcase}%")
  end

  def average_rate
    return -1 if course_ratings.empty?
    course_ratings.sum(&:rate) / course_ratings.size
  end

  def in_wishlist?(student)
    wishes.each { |wish| return true if wish.student == student }
    false
  end
end
