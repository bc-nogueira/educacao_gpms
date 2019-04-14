module CoursesHelper
  def course_teacher?(course)
    user_signed_in? && course.teacher == current_user.teacher
  end
end
