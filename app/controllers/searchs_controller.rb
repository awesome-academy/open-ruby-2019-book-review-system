class SearchsController < ApplicationController
  def show
    @book = Book.find_by name: params[:search]
    @posts = Post.find_post(@book.id).page(params[:page]).per Settings.paginate.length if @book
  end

  private
  def search_params
    params.require(:search).permit :search
  end
end
