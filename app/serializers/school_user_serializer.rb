class SchoolUserSerializer < ActiveModel::Serializer
	attributes :id, :school_id, :user_id
	belongs_to :user
	belongs_to :school
end