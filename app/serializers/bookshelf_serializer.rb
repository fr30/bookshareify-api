class BookshelfSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude

  has_many :books, serializer: BookSerializer
end
