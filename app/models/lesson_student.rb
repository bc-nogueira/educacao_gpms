class LessonStudent < ApplicationRecord
  belongs_to :student
  belongs_to :lesson

  scope :by_lesson, ->(lesson_id) { where(lesson_id: lesson_id) }
  scope :by_student, ->(student_id) { where(student_id: student_id) }
end
