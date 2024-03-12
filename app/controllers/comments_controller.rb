class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was published.'
    else
      redirect_to post_path(@post), error: 'Comment submission failed.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
