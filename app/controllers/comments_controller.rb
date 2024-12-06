class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.post_comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
