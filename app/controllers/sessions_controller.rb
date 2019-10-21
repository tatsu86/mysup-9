class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to posts_path
      else
        redirect_back fallback_location: root_path, flash: {
          danger: 'メールアドレスまたはパスワードが間違えています。'
        }
      end
    end
  
    def destroy
      session.delete(:user_id)
      redirect_to root_path
    end
  end
  