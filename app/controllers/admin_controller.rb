class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_super_admin

  def dashboard
    @branches = CooperativeBranch.all
    @total_users = User.count
    @total_branches = @branches.count
  end

  def branches
    @branches = CooperativeBranch.includes(:users).all
  end

  def show_branch
    @branch = CooperativeBranch.find(params[:id])
    @users = @branch.users.includes(:cooperative_branch)
  end

  def new_branch
    @branch = CooperativeBranch.new
  end

  def create_branch
    @branch = CooperativeBranch.new(branch_params)
    
    if @branch.save
      redirect_to admin_branches_path, notice: 'Branch created successfully.'
    else
      render :new_branch
    end
  end

  def edit_branch
    @branch = CooperativeBranch.find(params[:id])
  end

  def update_branch
    @branch = CooperativeBranch.find(params[:id])
    
    if @branch.update(branch_params)
      redirect_to admin_show_branch_path(@branch), notice: 'Branch updated successfully.'
    else
      render :edit_branch
    end
  end

  def destroy_branch
    @branch = CooperativeBranch.find(params[:id])
    
    if @branch.users.exists?
      redirect_to admin_branches_path, alert: 'Cannot delete branch with existing users. Please reassign users first.'
    else
      @branch.destroy
      redirect_to admin_branches_path, notice: 'Branch deleted successfully.'
    end
  end

  def users
    @users = User.includes(:cooperative_branch).all
    @branches = CooperativeBranch.all
  end

  def new_user
    @user = User.new
    @branches = CooperativeBranch.all
  end

  def create_user
    @user = User.new(user_params)
    
    if @user.save
      redirect_to admin_users_path, notice: 'User created successfully.'
    else
      @branches = CooperativeBranch.all
      render :new_user
    end
  end

  def edit_user
    @user = User.find(params[:id])
    @branches = CooperativeBranch.all
  end

  def update_user
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User updated successfully.'
    else
      @branches = CooperativeBranch.all
      render :edit_user
    end
  end

  def destroy_user
    @user = User.find(params[:id])
    
    if @user.super_admin?
      redirect_to admin_users_path, alert: 'Cannot delete super admin user.'
    else
      @user.destroy
      redirect_to admin_users_path, notice: 'User deleted successfully.'
    end
  end

  private

  def ensure_super_admin
    unless current_user.super_admin?
      redirect_to root_path, alert: 'Access denied. Super admin privileges required.'
    end
  end

  def branch_params
    params.require(:cooperative_branch).permit(:name, :cooperative_bank_id, :english_address, :kannada_address, :r_no, :phone_no)
  end

  def user_params
    permitted_params = params.require(:user).permit(:email, :role, :cooperative_branch_id)
    
    if params[:user][:password].present?
      permitted_params = permitted_params.merge(
        params.require(:user).permit(:password, :password_confirmation)
      )
    end
    
    permitted_params
  end
end