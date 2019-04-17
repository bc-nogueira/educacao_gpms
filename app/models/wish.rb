class Wish < ApplicationRecord
  belongs_to :course
  belongs_to :student

  scope :by_student, ->(student_id) { where(student_id: student_id) }
end
