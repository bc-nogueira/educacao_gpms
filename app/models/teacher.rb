class Teacher < ApplicationRecord
  belongs_to :user

  has_many :teacher_ratings

  has_and_belongs_to_many :courses
end
