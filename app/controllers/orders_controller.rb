class OrdersController < ApplicationController
  before_action :set_order, only: :add_course
  before_action :find_order, only: [:remove_course, :pay, :finalize]

  def student_orders
    @orders = current_user.student.orders.closed
  end

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
    @order.course_orders.by_course(params[:id]).first.destroy
    if @order.course_orders.any?
      flash[:notice] = 'Curso excluído do carrinho'
      redirect_to order_path(id: @order.id)
    else
      session.delete(:order_id)
      @order.destroy
      flash[:notice] = 'Curso excluído do carrinho.'
      redirect_to root_path
    end
  end

  def pay; end

  def finalize
    current_user.student.add_courses(@order.courses)
    @order.update(situation: :closed)
    session.delete(:order_id)
    redirect_to root_path
  end

  private

  def set_order
    @order = helpers.current_order
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(situation: :open, student_id: current_user.student.id)
    session[:order_id] = @order.id
  end

  def find_order
    @order = helpers.current_order
  end
end
