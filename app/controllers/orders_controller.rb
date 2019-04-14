class OrdersController < ApplicationController
  before_action :set_order, only: :add_course

  def index
    @order = helpers.current_order
  end

  def add_course
    @order = set_order
    @order.course_orders.create(course_id: params[:id])
    flash[:notice] = 'Curso adicionado ao carrinho.'
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(situation: :open, student_id: current_user.student.id)
    session[:order_id] = @order.id
  end
end
