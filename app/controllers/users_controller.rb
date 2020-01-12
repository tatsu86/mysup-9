class UsersController < ApplicationController
  def new 
    @user = User.new(flash[:user])
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to home_path
    else
      redirect_back fallback_location: new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end
  
  def show
    if params[:unique_id].to_s == @current_user.unique_id.to_s
      @user = User.find_by(unique_id: @current_user.unique_id)
    else
      # 他アカウントの情報
      @user = User.find_by(unique_id: params[:unique_id])
    end

    @myposts = Post.where(user_id: @current_user.id)
    @myposts = @myposts.order(created_at: :desc).page(params[:page])

    # select * from posts where id in (select post_id from likes where user_id=?);
    like_ids = Like.select("post_id").where(user_id: @current_user.id)
    @like_posts = Post.where("id in (?)", like_ids)
    @like_posts = @like_posts.order(created_at: :desc).page(params[:page])
  end
  
  def edit
    @user = User.find(@current_user.id)
  end
  
  def update
    @user = User.find(@current_user.id)
    if @user.update_attributes(update_account_params)
      redirect_to "/#{@current_user.unique_id.to_s}"
    else
      redirect_back fallback_location: settings_profile_path, flash:{
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