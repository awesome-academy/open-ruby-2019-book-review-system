class PostsController < ApplicationController
  def show
    @post = Post.find_by id: params[:id]

    if @post
      @comments = @post.comments
    else
      flash[:danger] = t ".danger"
      redirect_to root_path
    end
  end
end
