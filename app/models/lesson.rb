class Lesson < ApplicationRecord
  belongs_to :course

  scope :by_course, ->(course_id) { where(course_id: course_id) }
  scope :order_by_position, -> { order(position: :asc) }
end
