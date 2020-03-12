class UsersController < ApplicationController
  def show
    if params[:unique_id].to_s == current_user.unique_id.to_s
      @user = User.find_by(unique_id: current_user.unique_id)
    else
      # 他アカウントの情報
      @user = User.find_by(unique_id: params[:unique_id])
    end

    @myposts = Post.where(user_id: @user.id)
    @myposts = @myposts.order(created_at: :desc).page(params[:page])

    # select * from posts where id in (select post_id from likes where user_id=?);
    like_ids = Like.select("post_id").where(user_id: current_user.id)
    @like_posts = Post.where("id in (?)", like_ids)
    @like_posts = @like_posts.order(created_at: :desc).page(params[:page])
  end

  def following
    follow_ids = []
    current_user.relationships.order(created_at: :desc).each do |relation|
      follow_ids.push(relation.follow_id)
    end
    @follows = User.where(id: follow_ids).order(['field(id, ?)', follow_ids])
  end

  def followers
    user_ids = []
    Relationship.where(follow_id: current_user.id).order(created_at: :desc).each do |relation|
      user_ids.push(relation.user_id)
    end
    @followers = User.where(id: user_ids).order(['field(id, ?)', user_ids])
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(update_account_params)
      redirect_to "/#{current_user.unique_id.to_s}"
    else
      redirect_back fallback_location: settings_profile_path, flash:{
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end
  
  private
  
  def update_account_params
    params.require(:user).permit(
      :name, :introduction, :birthday, :sex, :favorite1, :favorite2, :favorite3, :image, :image_cache, :remove_image
    )
  end
end