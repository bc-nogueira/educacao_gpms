class Lesson < ApplicationRecord
  belongs_to :course

  has_many :notifications

  validates :title, :position, :video_url, :description, presence: true

  # course_id && position
  validates :position, uniqueness: { scope: :course_id }

  scope :by_course, ->(course_id) { where(course_id: course_id) }
  scope :order_by_position, -> { order(position: :asc) }
end
