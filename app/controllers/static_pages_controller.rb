class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: :home

  def home
    @posts = Post.order_desc.page(params[:page]).per Settings.paginate.length
  end
end
