class TeacherRating < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  scope :by_teacher, ->(teacher_id) { where(teacher_id: teacher_id) }
end
