class PostsController < ApplicationController
    before_action :set_target_post, only: [:show, :update, :destroy]

    def index
        @posts = @posts.search(params[:search])
    end

    def new
        @post = Post.new
    end

    def create 
        post = Post.new(post_params)
        
        if post.save 
            flash[:success] = "投稿しました。"
            redirect_to posts_path
        else
            redirect_to new_post_path
        end
    end

    def show
        @comment = Comment.new(post_id: @post.id)
    end

    def destroy
        @post.destroy
        redirect_to posts_path, flash: { notice: "削除しました。" }
    end

    private
    def post_params
        params.require(:post).permit(:body, :user_id)
    end

    def set_target_post
        @post = Post.find(params[:id])
    end
end