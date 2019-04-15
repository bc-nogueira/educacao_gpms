class CourseRatingsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @course_rating = CourseRating.new
  end

  def create
    course_rating = CourseRating.new(course_rating_params)
    if course_rating.save
      flash[:notice] = 'Comentário adicionado com sucesso!'
      redirect_to course_path course_rating.course
    end
  end

  private

  def course_rating_params
    params.require(:course_rating)
        .permit(:course_id, :student_id, :rate, :comment)
  end
end
