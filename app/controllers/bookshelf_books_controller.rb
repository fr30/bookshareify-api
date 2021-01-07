class BookshelfBooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotUnique, with: :association_exists
  before_action :set_bookshelf_book, only: [:show, :update, :destroy]

  # GET /bookshelves
  def index
    @bookshelf_book = BookshelfBook.all

    render json: @bookshelf_book
  end

  # GET /bookshelves/1
  def show
    render json: @bookshelf_book
  end

  # POST /bookshelves
  def create
    @bookshelf_book = BookshelfBook.create!(parsed_params)

    render json: @bookshelf_book, status: :created
  end

  # DELETE /bookshelves/1
  def destroy
    @bookshelf_book.destroy!
  end

  private

  def set_bookshelf_book
    @bookshelf_book = BookshelfBook.find_by!(parsed_params)
  end

  def parsed_params
    params.permit(:bookshelf_id, :book_id)
  end

  def association_exists(_)
    render json: {error: 'relation with given ids already exists'}, status: 422
  end
end
