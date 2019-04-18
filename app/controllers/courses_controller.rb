class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def search
    @courses = Course.by_name_like(params[:search])
  end

  def student_courses
    @courses = current_user.student.courses
  end

  def teacher_courses
    @courses = current_user.teacher.courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.transaction do
      @course.save
      Notification.create_for_course(@course)
      flash[:notice] = 'Curso criado com sucesso!'
      redirect_to courses_path
    end
  rescue ActiveRecord::RecordInvalid => errors
    flash.now[:error] = 'Erro ao criar curso.'
    render :new
  end

  private

  def course_params
    params.require(:course)
        .permit(:teacher_id, :name, :price, :description, :syllabus)
  end
end
