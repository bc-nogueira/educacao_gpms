require 'video_info'

class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :destroy]

  def show
    @playlist = VideoInfo.new(@lesson.video_url)
  end

  def new
    @lesson = Lesson.new(course_id: params[:course_id])
  end

  def create
    @lesson = Lesson.new(lessons_params)
    if @lesson.save
      flash[:notice] = 'Aula criada com sucesso!'
      redirect_to course_path @lesson.course.id
    end
  end

  def edit; end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lessons_params)
      flash[:notice] = 'Aula atualizada com sucesso!'
      redirect_to course_path @lesson.course.id
    end
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

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
