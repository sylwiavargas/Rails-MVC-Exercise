class AuthorsController < ApplicationController

before_action :find_author, only: [:show, :edit, :destroy]

    def index
      @authors = Author.all
    end

    def new
      @author = Author.new(author_params)
    end

    def create
      if @author = Author.create(author_params)
        redirect_to @author
      else
        render :new
      end
    end

    def update
      if find_author.update(author_params)
        redirect_to @author
      else
        render :edit
      end
    end

    def destroy
      @author.destroy
      redirect_to authors_path
    end

  private
    def find_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :birth_year)
    end

end
