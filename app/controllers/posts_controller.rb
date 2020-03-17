class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by id: params[:id]

    if @post
      @comments = @post.comments
    else
      flash[:danger] = t ".danger"
      redirect_to root_path
    end
  end

  def create
    @post = Post.new post_params.merge(user_id: current_user.id)

    if @post.save
      flash[:success] = t ".success"
      redirect_to @post
    else
      flash.now[:danger] = t ".danger"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit Post::POST_PARAMS
  end
end
