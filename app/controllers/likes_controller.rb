class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: current_user)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    if @like.user == current_user
      @like.destroy
    end

    redirect_to post_path(@post)
  end
end
