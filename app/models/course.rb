class Course < ApplicationRecord
  belongs_to :teacher

  has_many :course_ratings

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :students
end
