require 'rails_helper'

RSpec.describe UserLecture, type: :model do
  let(:lecture) {
    Lecture.create(
      :name => "American Literature",
      :time => "1500",
      :day => "Monday, Wednesday, Firday",
      :location => "Room 100"
    )
  }

end
