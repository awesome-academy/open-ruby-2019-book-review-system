class PostsController < ApplicationController
  skip_before_action :require_login, only: :show

  def show
    @post = Post.find_by id: params[:id]
  end
end
