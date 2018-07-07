require 'rails_helper'

RSpec.describe Lecture, type: :model do
  let(:lecture) {
    Lecture.create(
      :name => "American Literature",
      :time => "1500",
      :day => "Monday, Wednesday, Firday",
      :location => "Room 100"
    )
  }

  it "is valid with a name, time, day, and location" do
    expect(lecture).to be_valid
  end
  
end
