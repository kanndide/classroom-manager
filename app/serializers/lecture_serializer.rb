class LectureSerializer < ActiveModel::Serializer
  attributes :id, :name, :time, :day, :location, :semester, :year
  belongs_to :school
  has_many :user_lectures
  has_many :users, through: :user_lectures
end
