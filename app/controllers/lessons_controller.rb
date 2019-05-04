require 'video_info'

class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update, :destroy]

  def show
    @playlist = VideoInfo.new(@lesson.video_url)
  end

  def new
    @lesson = Lesson.new(course_id: params[:course_id])
  end

  def create
    @lesson = Lesson.new(lessons_params)
    @lesson.transaction do
      @lesson.save!
      Notification.create_for_lesson(@lesson)
      flash[:notice] = 'Aula criada com sucesso!'
      redirect_to course_path @lesson.course.id
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit; end

  def update
    render :edit and return unless @lesson.update(lessons_params)
    flash[:notice] = 'Aula atualizada com sucesso!'
    redirect_to course_path @lesson.course.id
  end

  def destroy
    course = @lesson.course
    @lesson.destroy
    flash[:notice] = 'Aula removida com sucesso!'
    redirect_to course_path course
  end

  private

  def lessons_params
    params.require(:lesson)
        .permit(:course_id, :title, :description, :position, :video_url)
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end
end
