module CoursesHelper
  def course_teacher?(course)
    user_signed_in? && course.teacher == current_user.teacher
  end

  def well_evaluated_courses(courses)
    courses = courses.select { |course| course.average_rate >= 4 }[0..4]
    courses.sort_by{ |course| [course.average_rate]}.reverse
  end
end
