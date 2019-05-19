module CoursesHelper
  def course_teacher?(course)
    user_signed_in? && course.teacher == current_user.teacher
  end

  def course_image(course)
    return course.image if course.image.attached?
    'https://bit.ly/30uT964'
  end

  def courses_to_buy(courses)
    courses_to_buy = courses.each.map do |course|
      course.id unless current_user.student.has_course?(course)
    end
    courses_to_buy.compact
  end
end
