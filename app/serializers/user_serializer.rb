class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :teacher, :admin
  has_many :lectures
  has_many :schools
end
