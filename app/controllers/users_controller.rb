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
    # TODO:生のSQLは叩かないように
    query = "select * from posts"
    query += " where posts.id in (select post_id from likes "
    query += " where likes.user_id=" + @current_user.id.to_s + ")"
    @like_posts = Post.find_by_sql(query)
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