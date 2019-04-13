class Student < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :course_ratings
  has_many :purchases
  has_many :teacher_ratings

  has_and_belongs_to_many :courses
end
