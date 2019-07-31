class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @comment.topic_id ||= params[:topic_id]
    # binding.pry
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    # binding.pry

    if @comment.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = 'シッパイs'
      @comment.topic_id ||= params[:comment][:topic_id]
      # binding.pry
      render :new
      # binding.pry
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :topic_id)
  end
end
