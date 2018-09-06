class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :teacher, :admin
  has_many :user_lectures
  has_many :lectures, through: :user_lectures
  has_many :school_users
  has_many :schools, through: :school_users
end
