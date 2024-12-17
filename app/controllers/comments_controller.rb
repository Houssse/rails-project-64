# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = t('flash.notice.comment_created')
    else
      flash[:alert] = @comment.errors.full_messages.last
    end

    redirect_to(@post)
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
