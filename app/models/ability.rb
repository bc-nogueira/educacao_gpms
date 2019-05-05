# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user, params = nil)
    # Abilities for users that are not logged
    can [:index, :show, :search, :student_courses, :teacher_courses], Course
    can :show, Student
    can [:index, :show], Teacher
    return if user.nil?
    # Abilities for student
    can [:new, :create], CourseRating do
      course_id = params[:course_id] || params[:course_rating][:course_id]
      course = Course.find(course_id)
      user.student.has_course?(course) if course.present?
    end
    can [:edit, :update, :destroy], CourseRating, student_id: user.id
    can :show, Lesson, course: { students: { id: user.id } }
    can [:index, :update, :destroy], Notification, student_id: user.id
    can :manage, Order, student_id: user.id
    can [:follow_teacher, :unfollow_teacher], Student
    can [:new, :create], Teacher
    can [:new, :create], TeacherRating do
      teacher_id = params[:teacher_id] || params[:teacher_rating][:teacher_id]
      Teacher.find(teacher_id).teaches_student?(user.student)
    end
    can [:edit, :update, :destroy], TeacherRating, student_id: user.id
    can :create, Wish
    can [:index, :destroy, :destroy_all], Wish, student_id: user.id
    return unless user.teacher?
    # Abilities for teacher
    can [:new, :create, :edit, :update], Course, teacher_id: user.id
    can :new, Lesson do
      return if params[:course_id].nil?
      user.teacher.teaches_course?(Course.find(params[:course_id]))
    end
    can [:show, :create, :edit, :update, :destroy], Lesson,
        course: { teacher_id: user.id }
  end
end
