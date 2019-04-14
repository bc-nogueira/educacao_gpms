class CourseOrder < ApplicationRecord
  belongs_to :course
  belongs_to :order

  scope :by_course, ->(course_id) { where(course_id: course_id) }
end
