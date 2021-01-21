class Book < ApplicationRecord
  validates :title, :author, :publisher, :genre, presence: true

  has_many :bookshelf_books
  has_many :bookshelves, through: :bookshelf_books
end
