class Teacher < ApplicationRecord
  belongs_to :user

  has_many :courses
  has_many :teacher_ratings
end
