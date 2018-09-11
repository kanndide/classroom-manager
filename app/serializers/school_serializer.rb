class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :lectures
  has_many :users
end
