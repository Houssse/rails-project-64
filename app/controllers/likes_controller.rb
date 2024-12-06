class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.post_likes.create(user: current_user)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.post_likes.find(params[:id])
    @like.destroy

    redirect_to post_path(@post)
  end
end
