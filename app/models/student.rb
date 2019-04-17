class Student < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :course_ratings
  has_many :orders
  has_many :purchases
  has_many :teacher_ratings

  has_and_belongs_to_many :courses

  def add_courses(courses)
    courses.each { |course| self.courses << course }
    save
  end

  def has_course?(course)
    self.courses.include? course
  end

  def rated_course?(course)
    self.course_ratings.by_course(course.id).exists?
  end

  def rated_teacher?(teacher)
    self.teacher_ratings.by_teacher(teacher.id).exists?
  end
end
