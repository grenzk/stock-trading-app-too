class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_client

  def set_client 
    @client = IEX::Api::Client.new
  end

  def after_sign_in_path_for(resource)
    return admin_path if current_user.admin?
    return marketplace_index_path if current_user.trader?
  end
end
