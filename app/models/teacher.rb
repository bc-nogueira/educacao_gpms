class Teacher < ApplicationRecord
  acts_as_followable

  belongs_to :user

  has_many :courses
  has_many :teacher_ratings

  validates :phone_number, presence: true

  def email
    user.email
  end

  def gender
    user.gender
  end

  def name
    user.name
  end

  def teaches_student?(student)
    courses.each { |course| return true if course.students.include? student }
    false
  end

  def teaches_course?(course)
    self.courses.include? course
  end

  def average_rate
    return -1 if teacher_ratings.empty?
    teacher_ratings.sum(&:rate) / teacher_ratings.size
  end

  def students
    courses.sum(&:students).length
  end
end
