module CoursesHelper
  def course_teacher?(course)
    user_signed_in? && course.teacher == current_user.teacher
  end

  def course_image(course)
    return course.image if course.image.attached?
    'https://bit.ly/30uT964'
  end
end
