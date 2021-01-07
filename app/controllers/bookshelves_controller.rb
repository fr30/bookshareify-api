class BookshelvesController < ApplicationController
  before_action :set_bookshelf, only: [:show, :update, :destroy]

  # GET /bookshelves
  def index
    @bookshelves = Bookshelf.all

    render json: @bookshelves
  end

  # GET /bookshelves/1
  def show
    render json: @bookshelf
  end

  # POST /bookshelves
  def create
    @bookshelf = Bookshelf.create!(create_params)

    render json: @bookshelf, status: :created
  end

  # DELETE /bookshelves/1
  def destroy
    @bookshelf.bookshelf_books.destroy_all
    @bookshelf.destroy!
  end

  private
    def set_bookshelf
      @bookshelf = Bookshelf.left_joins(:books).find(params[:id])
    end

    def create_params
      params.permit(:longitude, :latitude)
    end
end
