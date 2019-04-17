class CourseRatingsController < ApplicationController
  def new
    # @course = Course.find(params[:course_id])
    @course_rating = CourseRating.new
    @course_rating.course = Course.find(params[:course_id])
  end

  def create
    course_rating = CourseRating.new(course_rating_params)
    if course_rating.save
      flash[:notice] = 'Avaliação adicionada com sucesso!'
      redirect_to course_path course_rating.course
    end
  end

  def edit
    @course_rating = CourseRating.find(params[:id])
  end

  def update
    course_rating = CourseRating.find(params[:id])
    course_rating.update(course_rating_params)
    flash[:notice] = 'Avaliação atualizada com sucesso!'
    redirect_to course_path course_rating.course
  end

  def destroy
    course_rating = CourseRating.find(params[:id])
    course = course_rating.course
    course_rating.destroy
    flash[:notice] = 'Avaliação excluída com sucesso.'
    redirect_to course_path course
  end

  private

  def course_rating_params
    params.require(:course_rating)
        .permit(:course_id, :student_id, :rate, :comment)
  end
end
