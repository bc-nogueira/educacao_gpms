class CourseRating < ApplicationRecord
  belongs_to :course
  belongs_to :student

  scope :by_course, ->(course_id) { where(course_id: course_id) }

  validates :rate, :comment, presence: true
end
