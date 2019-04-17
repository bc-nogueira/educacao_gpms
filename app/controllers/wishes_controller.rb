class WishesController < ApplicationController
  def index
    @wishes = Wish.by_student(current_user.student)
  end

  def create
    wish = Wish.new(wish_params)
    if wish.save
      flash[:notice] = 'Curso adicionado a lista de desejos com sucesso.'
      redirect_to wishes_path
    end
  end

  def destroy
    Wish.find(params[:id]).destroy
    flash[:notice] = 'Curso removido da lista de desejo.'
    redirect_to current_user.student.wishes.empty? ? root_path: wishes_path
  end

  def destroy_all
    Wish.by_student(current_user.student).destroy_all
    flash[:notice] = 'Todos os cursos removidos da lista de desejos'
    redirect_to root_path
  end

  private

  def wish_params
    params.require(:wish).permit(:course_id, :student_id)
  end
end
