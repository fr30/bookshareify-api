class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :publisher
end
