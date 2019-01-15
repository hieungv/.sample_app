class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit destroy update)
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(destroy)
  def index
    @users = User.page(params[:page]).per Settings.pages_limit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:success] = t "check"
      redirect_to root_path
    else
      flash[:danger] = t "users_controller.danger"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "upuser"
      redirect_to @user
    else
      flash[:danger] = t "erupuser"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "sdelete"
    else
      flash[:danger] = t "er_delete"
    end
    redirect_to users_url
  end

  private

  attr_reader :user

  def admin_user
    return if current_user.admin?
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    return if (@user = User.find_by id: params[:id])
    flash[:danger] = t "users_controller.danger"
    redirect_to home_path
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "erlogin"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless current_user.current_user?(@user)
  end
end
