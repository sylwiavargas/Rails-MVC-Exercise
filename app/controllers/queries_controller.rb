class QueriesController < ApplicationController

  before_action :find_query, only: :destroy

  def create
    @query = Query.create(query_params)
    @book = Book.find(@query.book_id)
    redirect_to @book
  end

  def destroy
    @book = Book.find(@query.book.id)
    @query.destroy
    redirect_to @book
  end

private
  def find_query
    @book = Book.find(params[:id])
  end

  def query_params
    params.require(:book).permit(:title, :pages)
  end

end
