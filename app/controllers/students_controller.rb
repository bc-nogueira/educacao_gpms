class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def follow_teacher
    student = helpers.current_user.student
    teacher = Teacher.find(params[:teacher_id])
    student.follow(teacher)
    redirect_to teacher_path teacher
  end

  def unfollow_teacher
    student = helpers.current_user.student
    teacher = Teacher.find(params[:teacher_id])
    student.stop_following(teacher)
    redirect_to teacher_path teacher
  end
end
