class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    # This fixes errors in 7.0.3 not observed in 6 or earlier
    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
