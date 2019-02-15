class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.page(params[:page]).per Settings.pages_limit
  end

  def help;  end

  def login; end

  def about; end

  def contact; end
end
