# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_or_create_by(user: current_user)

    redirect_to(post_path(@post))
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    @like.destroy if @like.user == current_user

    redirect_to(post_path(@post))
  end
end
