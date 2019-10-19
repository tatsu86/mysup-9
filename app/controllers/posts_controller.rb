class PostsController < ApplicationController
    def index
        @posts = Post.all
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

    def destroy
        @post.destroy
        redirect_to posts_path, flash: { notice: "削除しました。" }
    end

    private
    def post_params
        params.require(:post).permit(:body, :user_id)
    end
end