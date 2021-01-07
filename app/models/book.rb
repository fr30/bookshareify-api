class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true

  has_many :bookshelf_books
  has_many :bookshelves, through: :bookshelf_books
end
