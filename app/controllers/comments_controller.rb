class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
