class TeacherRatingsController < ApplicationController
  def new
    @teacher_rating = TeacherRating.new
    @teacher_rating.teacher = Teacher.find(params[:teacher_id])
  end

  def create
    teacher_rating = TeacherRating.new(teacher_rating_params)
    if teacher_rating.save
      flash[:notice] = 'Avaliação adicionada com sucesso!'
      redirect_to teacher_path teacher_rating.teacher
    end
  end

  def edit
    @teacher_rating = TeacherRating.find(params[:id])
  end

  def update
    teacher_rating = TeacherRating.find(params[:id])
    teacher_rating.update(teacher_rating_params)
    flash[:notice] = 'Avaliação atualizada com sucesso!'
    redirect_to teacher_path teacher_rating.teacher
  end

  def destroy
    teacher_rating = TeacherRating.find(params[:id])
    teacher = teacher_rating.teacher
    teacher_rating.destroy
    flash[:notice] = 'Avaliação excluída com sucesso.'
    redirect_to teacher_path teacher
  end

  private

  def teacher_rating_params
    params.require(:teacher_rating)
        .permit(:teacher_id, :student_id, :rate, :comment)
  end
end
