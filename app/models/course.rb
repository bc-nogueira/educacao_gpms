class Course < ApplicationRecord
  monetize :price_cents

  belongs_to :teacher

  has_many :course_ratings
  has_many :course_orders
  has_many :orders, through: :course_orders

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :students

  scope :by_name_like, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :by_teacher, ->(teacher_id) { where(teacher_id: teacher_id) }
end
