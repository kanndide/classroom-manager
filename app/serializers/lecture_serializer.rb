class LectureSerializer < ActiveModel::Serializer
  attributes :id, :name, :time, :day, :location, :semester, :year
  belongs_to :school
  has_many :users
end


