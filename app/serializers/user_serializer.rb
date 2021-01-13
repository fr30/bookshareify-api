class UserSerializer < ActiveModel::Serializer
  attributes :login, :email, :name, :surname
end
