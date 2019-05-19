class CourseTrail < ApplicationRecord
  belongs_to :course
  belongs_to :trail

  scope :by_course, ->(course_id) { where(course_id: course_id) }
  scope :by_trail, ->(trail_id) { where(trail_id: trail_id) }
end
