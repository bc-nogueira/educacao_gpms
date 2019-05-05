class TeacherRatingsController < ApplicationController
  load_and_authorize_resource

  before_action :find_teacher_rating, only: [:edit, :update, :destroy]

  def new
    @teacher_rating = TeacherRating.new
    @teacher_rating.teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @teacher_rating = TeacherRating.new(teacher_rating_params)
    render :new and return unless @teacher_rating.save
    flash[:notice] = 'Avaliação adicionada com sucesso!'
    redirect_to teacher_path @teacher_rating.teacher
  end

  def edit; end

  def update
    @teacher_rating.update(teacher_rating_params)
    flash[:notice] = 'Avaliação atualizada com sucesso!'
    redirect_to teacher_path @teacher_rating.teacher
  end

  def destroy
    teacher = @teacher_rating.teacher
    @teacher_rating.destroy
    flash[:notice] = 'Avaliação excluída com sucesso.'
    redirect_to teacher_path teacher
  end

  private

  def find_teacher_rating
    @teacher_rating = TeacherRating.find(params[:id])
  end

  def teacher_rating_params
    params.require(:teacher_rating)
        .permit(:teacher_id, :student_id, :rate, :comment)
  end
end
