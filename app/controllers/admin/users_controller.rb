class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @users = User.includes(:cooperative_branch).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    password = Devise.friendly_token.first(10)
    @user.password = password
    @user.password_confirmation = password
    @user.cooperative_branch_id = Current.branch.id
    if @user.save
      @user.send_reset_password_instructions # Let them set a new password
      redirect_to admin_users_path, notice: 'User created. Reset password instructions sent via email.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  private

  def require_admin!
    redirect_to root_path unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email, :role, :cooperative_branch_id)
  end
end
