class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params

    if @book.save
      flash[:success] = t ".success"
      redirect_to new_post_path
    else
      flash.now[:danger] = t ".danger"
      render :new
    end
  end

  def show
    @book = Book.find_by id: params[:id]

    return if @book
    flash.now[:danger] = t ".danger"
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit Book::BOOK_PARAMS
  end
end
