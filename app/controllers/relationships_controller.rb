class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)

    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to "/#{user.unique_id.to_s}"
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to "/#{user.unique_id.to_s}"
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to "/#{user.unique_id.to_s}"
    else
      flash.now[:alert] = 'ユーザーのフォロ解除に失敗しました'
      redirect_to "/#{user.unique_id.to_s}"
    end
  end

  private

  def set_user
    user = User.find(params[:relationship][:follow_id])
  end
end
