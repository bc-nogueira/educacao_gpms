class CourseRating < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates :rate, :comment, presence: true

  scope :by_course, ->(course_id) { where(course_id: course_id) }
end
