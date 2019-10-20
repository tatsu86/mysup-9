class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :current_user
  before_action :posts_all
  
  private
  
  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def posts_all
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.order(created_at: :desc).page(params[:page])
  end
end
