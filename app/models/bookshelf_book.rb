class BookshelfBook < ApplicationRecord
  validates :bookshelf_id, presence: true
  validates :book_id, presence: true

  belongs_to :book
  belongs_to :bookshelf
end
