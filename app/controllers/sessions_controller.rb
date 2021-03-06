class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate(params[:session][:password])
      if user.activated?
        acc_activated user
      else
        acc_not_activated
      end
    else
      flash.now[:danger] = t "sessions_controller.er"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def acc_activated user
    log_in user
    params[:session][:remember_me] == Settings.one ? remember(user) : forget(user)
    redirect_back_or user
  end

  def acc_not_activated
    flash[:warning] = t "message"
    redirect_to root_url
  end
end
