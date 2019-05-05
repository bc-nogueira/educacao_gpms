class CourseRatingsController < ApplicationController
  load_and_authorize_resource

  before_action :find_course_rating, only: [:edit, :update, :destroy]

  # Só pode avaliar se tiver o curso
  def new
    @course_rating = CourseRating.new
    @course_rating.course = Course.find(params[:course_id])
  end

  def create
    @course_rating = CourseRating.new(course_rating_params)
    render :new and return unless @course_rating.save
    flash[:notice] = 'Avaliação adicionada com sucesso!'
    redirect_to course_path @course_rating.course
  end

  def edit; end

  def update
    render :edit and return unless @course_rating.update(course_rating_params)
    flash[:notice] = 'Avaliação atualizada com sucesso!'
    redirect_to course_path @course_rating.course
  end

  def destroy
    course = @course_rating.course
    @course_rating.destroy
    flash[:notice] = 'Avaliação excluída com sucesso.'
    redirect_to course_path course
  end

  private

  def find_course_rating
    @course_rating = CourseRating.find(params[:id])
  end

  def course_rating_params
    params.require(:course_rating)
        .permit(:course_id, :student_id, :rate, :comment)
  end
end
