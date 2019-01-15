class FollowingsController < ApplicationController
  before_action :logged_in_user, only: %i(show)

  def show
    @title = t "followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per Settings.pages_limit
    render "follow/show_follow"
  end
end
