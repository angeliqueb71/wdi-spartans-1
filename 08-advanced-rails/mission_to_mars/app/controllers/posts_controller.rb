class PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.order(id: :desc)
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
