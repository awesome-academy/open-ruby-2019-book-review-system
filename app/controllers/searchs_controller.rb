class SearchsController < ApplicationController
  skip_before_action :require_login, only: :show

  def show
    @book = Book.find_by name: params[:search]
    @posts = @book.posts.page(params[:page]).per Settings.paginate.length if @book
  end

  private
  def search_params
    params.require(:search).permit :search
  end
end
