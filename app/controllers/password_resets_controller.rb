class PasswordResetsController < ApplicationController
  before_action :find_user, :valid_user, :check_expiration, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase

    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "instructions"
      redirect_to root_url
    else
      flash.now[:danger] = t "er_email"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add :password, t("empty")
      render :edit
    elsif @user.update_attributes user_params
      log_in @user
      @user.update reset_digest: nil
      flash[:success] = t "password_reset"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def find_user
    return if (@user = User.find_by email: params[:email])
    flash[:danger] = t "users_controller.danger"
  end

  def valid_user
    unless @user&.activated? && @user.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end

  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = t "er_password_reset"
    redirect_to new_password_reset_url
  end
end
