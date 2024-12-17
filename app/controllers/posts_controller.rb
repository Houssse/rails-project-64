# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def index
    @posts = Post.includes(:creator)
  end

  def show
    @post = Post.find(params[:id])
    @like = current_user&.post_likes&.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @categories = Category.all

    if @post.save
      flash[:notice] = t('flash.notice.post_created')
      redirect_to(post_path(@post))
    else
      flash[:alert] = t('flash.alert.post_created')
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(creator_id: current_user.id)
  end
end
