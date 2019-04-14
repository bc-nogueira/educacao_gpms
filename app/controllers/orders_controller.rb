class OrdersController < ApplicationController
  before_action :set_order, only: :add_course

  def show
    @order = Order.find(params[:id])
  end

  def add_course
    @order = set_order
    @order.course_orders.create(course_id: params[:id])
    flash[:notice] = 'Curso adicionado ao carrinho.'
    redirect_to order_path(id: @order.id)
  end

  def remove_course
    order = helpers.current_order
    order.course_orders.by_course(params[:id]).first.destroy
    if order.course_orders.any?
      flash[:notice] = 'Curso excluído do carrinho'
      redirect_to order_path(id: order.id)
    else
      session.delete(:order_id)
      order.destroy
      flash[:notice] = 'Curso excluído do carrinho.'
      redirect_to root_path
    end
  end

  private

  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(situation: :open, student_id: current_user.student.id)
    session[:order_id] = @order.id
  end
end
