class UsersController < ApplicationController
  def new 
    @user = User.new(flash[:user])
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to posts_path
    else
      redirect_back fallback_location: new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end
  
  def show
    @user = User.find(@current_user.id)
    @myposts = Post.where(user_id: @current_user.id)
    @myposts = @myposts.order(created_at: :desc).page(params[:page])
    
    @like_posts = Post.where(id: Post.joins(:likes).select("post_id").where(user_id: @current_user.id))
    @like_posts = @like_posts.order(created_at: :desc).page(params[:page])
  end

  def other
    @user = User.find_by(unique_id: params[:unique_id])
    @myposts = Post.where(user_id: @user.id)
    @myposts = @myposts.order(created_at: :desc).page(params[:page])
    
    @like_posts = Post.where(id: Post.joins(:likes).select("post_id").where(user_id: @user.id))
    @like_posts = @like_posts.order(created_at: :desc).page(params[:page])
  end
  
  def edit
    @user = User.find(@current_user.id)
  end
  
  def update
    @user = User.find(@current_user.id)
    if @user.update_attributes(update_account_params)
      redirect_to mypage_path
    else
      redirect_back fallback_location: edit_user_path, flash:{
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end
  
  private
  # 新規登録
  def user_params
    params.require(:user).permit(
      :name, :unique_id, :email, :password, :password_confirmation
    )
  end
  
  #編集
  def update_account_params
    params.require(:user).permit(
      :name, :introduction, :birthday, :sex, :favorite1, :favorite2, :favorite3, :image, :image_cache, :remove_image
    )
  end
end