module ApplicationHelper
  def flash_type(type)
    return 'success' if type == 'notice'
    return 'danger' if %w[alert error].include?(type)
    type
  end

  def home_controller?
    controller_name == 'home'
  end
end
