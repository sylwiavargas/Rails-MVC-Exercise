class BooksController < ApplicationController
before_action :find_book, only: [:show, :edit, :destroy]

    def index
      @books = Book.all
    end

    def new
      @book = Book.new(book_params)
    end

    def create
      if @book = Book.create(book_params)
        redirect_to @book
      else
        render :new
      end
    end

    def show
      @create_query = Query.new
    end

    def update
      if find_book.update(book_params)
        redirect_to @book
      else
        render :edit
      end
    end

    def destroy
      @book.destroy
      redirect_to books_path
    end

  private
    def find_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :pages)
    end

end
