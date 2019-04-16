class Course < ApplicationRecord
  belongs_to :teacher

  has_many :course_ratings
  has_many :course_orders
  has_many :orders, through: :course_orders

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :students

  scope :by_name_like, ->(name) do
    where('LOWER(name) LIKE ?', "%#{name.downcase}%")
  end

  def average_rate
    return 0 if course_ratings.empty?
    course_ratings.sum(&:rate) / course_ratings.size
  end
end
