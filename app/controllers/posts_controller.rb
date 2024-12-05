class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(creator_id: current_user.id)
  end
end
