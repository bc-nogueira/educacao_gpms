class TeachersController < ApplicationController
  def new
    # current_user.teacher = Teacher.new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    render :new and return unless @teacher.save
    flash[:notice] = 'Seu perfil de professor foi ativado!'
    redirect_to root_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:user_id, :phone_number)
  end
end
