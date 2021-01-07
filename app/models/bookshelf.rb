class Bookshelf < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :bookshelf_books
  has_many :books, through: :bookshelf_books
end
