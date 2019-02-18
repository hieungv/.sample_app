class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def show
    @user = User.find_by id: params[:id]

    if params[:follow] == "following"
      @title = t "following"
      @users = @user.following.page(params[:page]).per Settings.pages_limit
    elsif params[:follow] == "followers"
      @title = t "followers"
      @users = @user.followers.page(params[:page]).per Settings.pages_limit
    end
    render "users/show_follow"
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
