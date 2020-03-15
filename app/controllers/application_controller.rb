class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :posts_all
  
  def after_sign_in_path_for(_resource)
    home_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  protected

  # devise専用のStrongParameter
  def configure_permitted_parameters
    # アカウント作成時のStrongParameterを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name unique_id])
    # アカウント編集時のStrongParameterを追加
    # devise_parameter_sanitizer.permit(:account_update, keys: %i[name image sex birthday introduction favorite1 favorite2 favorite3])
  end

  private
  
  def posts_all
    @posts = Post.all
    @posts = @posts.order(created_at: :desc).page(params[:page])

    @following_posts = []
    if user_signed_in? 
      
      follower_ids = []
      current_user.followings.each do |user|
        follower_ids.push(user.id)
      end
      @following_posts = Post.where("user_id in (?)", follower_ids)
      @following_posts = @following_posts.order(created_at: :desc).page(params[:page])
    end
  end
end
