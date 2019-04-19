class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_discount
  skip_before_action :set_discount, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :birthdate,
                                                       :gender])
  end

  def set_discount
    @discount = Discount.active.first
  end
end
