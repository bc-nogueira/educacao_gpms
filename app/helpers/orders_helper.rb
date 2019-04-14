module OrdersHelper
  def has_order?
    session[:order_id].present?
  end

  def current_order
    return unless user_signed_in?
    @order = Order.find(session[:order_id])
  end

  def order_has_course?(course)
    return unless user_signed_in?
    current_order.courses.include? course
  end
end
