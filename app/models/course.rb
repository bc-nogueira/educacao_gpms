class Course < ApplicationRecord
  has_many :course_ratings

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers
end
