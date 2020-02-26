class SessionsController < ApplicationController
  def create
    email = params[:session][:email]
    user = User.where(email: email).or(User.where(unique_id: email))
    user = user[0]
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to home_path
      flash[:success] = "ログインしました。"
    else
      redirect_back fallback_location: root_path, flash: {
        danger: '入力されたユーザーIDやパスワードが正しくありません。'
      }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end