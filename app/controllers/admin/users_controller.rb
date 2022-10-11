class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.where(role: :trader)
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
