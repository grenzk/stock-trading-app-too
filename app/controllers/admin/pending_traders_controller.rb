class Admin::PendingTradersController < ApplicationController
  def index
    @users = User.where(approved: false, role: :trader)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(approved: :true)
      redirect_to admin_users_path, notice: 'User has been approved.'
    else
      render :index, status: :unprocessable_entity
    end
  end
end
