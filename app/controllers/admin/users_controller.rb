class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.where(role: :trader)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.confirmed_at = Time.now

    if @user.save
      redirect_to admin_users_path, notice: 'Account was successfully created.'
    else
      flash.now[:notice] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :approved
    )
  end
end
