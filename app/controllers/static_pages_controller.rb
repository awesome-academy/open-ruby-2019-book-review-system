class StaticPagesController < ApplicationController
  def home
    @posts = Post.order_desc.page(params[:page]).per Settings.paginate.length
  end
end
