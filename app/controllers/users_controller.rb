class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
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
  
  def user_params
    params.require(:user).permit(:name, :unique_id, :email, :password, :password_confirmation)
  end
  
  def update_account_params
    params.require(:user).permit(:name, :introduction, :birthday, :sex, :favorite1, :favorite2, :favorite3)
  end
end