class Trail < ApplicationRecord
  has_many :course_trails
  has_many :courses, through: :course_trails

  has_one_attached :image

  validates :title, :description, presence: true
end
