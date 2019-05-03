class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update]

  def index
    @courses = Course.all
  end

  def show; end

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
      @course.save!
      Notification.create_for_course(@course)
      flash[:notice] = 'Curso criado com sucesso!'
      redirect_to courses_path
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit; end

  def update
    @course.update(course_params)
    render :edit and return unless @course.update(course_params)
    flash[:notice] = 'Curso atualizado com sucesso!'
    redirect_to @course
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course)
        .permit(:teacher_id, :name, :price, :description, :syllabus)
  end
end
