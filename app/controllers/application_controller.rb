class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_discount
  skip_before_action :set_discount, if: :devise_controller?

  before_action do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  # TODO: Encaminhar para origem
  rescue_from CanCan::AccessDenied do
    flash[:error] = ' Você não tem autorização para realizar essa ação.'
    redirect_back(fallback_location: root_path)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :birthdate,
                                                       :gender])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, request.params)
  end

  def set_discount
    @active_discount = Discount.active.first
  end
end
