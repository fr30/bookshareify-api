class BookshelfBookSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :bookshelf_id
end
