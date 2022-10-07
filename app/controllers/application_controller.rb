class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    return admin_path if current_user.admin?
  end
end
