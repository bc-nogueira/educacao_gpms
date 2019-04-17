class Teacher < ApplicationRecord
  belongs_to :user

  has_many :courses
  has_many :teacher_ratings

  def teaches?(student)
    courses.each { |course| return true if course.students.include? student }
    false
  end
end
