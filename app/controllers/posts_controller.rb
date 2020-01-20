class PostsController < ApplicationController
    before_action :set_target_post, only: [:show, :update, :destroy]

    def index

    end

    def search
        if params[:search].blank? == false || params[:tag_id].blank? == false
            @search_params = true
        else
            @search_params = false
        end
        # TODO:検索していないときは、最新の20件
        if @search_params
            @search_posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
            @search_posts = @search_posts.search(params[:search])
            @search_posts = @search_posts.order(created_at: :desc).page(params[:page])
            @search_users = User.all.search_user(params[:search])
        else
            @search_posts = Post.all
            @search_posts = @search_posts.order(created_at: :desc).limit(20).page(params[:page])
        end
    end

    def new
        @post = Post.new
    end

    def create 
        post = Post.new(post_params)
        
        if post.save 
            flash[:success] = "投稿しました。"
            redirect_to home_path
        else
            redirect_to new_post_path, flash: {
                post: post,
                error_messages: post.errors.full_messages
            }
        end
    end

    def show
        @comment = Comment.new(post_id: @post.id)
    end

    def destroy
        @post.destroy
        redirect_to home_path, flash: { notice: "削除しました。" }
    end

    private
    def post_params
        params.require(:post).permit(:body, :user_id,:evaluation, tag_ids: [])
    end

    def set_target_post
        @post = Post.find(params[:id])
    end
end