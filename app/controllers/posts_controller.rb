class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :new ]

  def show
    @post = Post.find(params[:id])
    if current_user
      @like = current_user.post_likes.find_by(post_id: @post.id)
    else
      @like = nil
    end
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @categories = Category.all

    if @post.save
      flash[:notice] = "Пост опубликован"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Не удалось создать пост. Проверьте введенные данные"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(creator_id: current_user.id)
  end
end
