module ApplicationHelper
  def flash_type(type)
    return 'success' if type == 'notice'
    return 'danger' if %w[alert error].include?(type)
    type
  end
end
