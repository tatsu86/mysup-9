class CommentsController < ApplicationController
    def create
      comment = Comment.new(comment_params)
      if comment.save
        flash[:notice] = 'コメントを投稿しました。'
        redirect_to comment.post
      else
        redirect_back fallback_location: root_path, flash: {
          comment: comment,
          error_messages: comment.errors.full_messages
        }
      end
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.delete
      redirect_to comment.post, flash: { notice: 'コメントを削除しました。' }
    end
    
    private
    
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :comment)
    end
  end  