class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Services::BooksSearch.new(search_params).query

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.create!(create_params)

    render json: @book, status: :created
  end

  # PATCH/PUT /books/1
  def update
    @book.update!(update_params)

    render json: @book
  end

  # DELETE /books/1
  def destroy
    @book.bookshelf_books.destroy_all
    @book.destroy!
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def create_params
    params.permit(:title, :author)
  end

  def update_params
    params.permit(:id, :title, :author)
  end

  def search_params
    params.permit(:title, :author)
  end
end
