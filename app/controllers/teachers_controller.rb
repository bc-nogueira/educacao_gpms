class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
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
