class CourseOrder < ApplicationRecord
  belongs_to :course
  belongs_to :order
end
