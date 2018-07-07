require 'rails_helper'

RSpec.describe School, type: :model do
  let(:school) {
    Lecture.create(
      :name => "Orange County High School"
    )
  }

  it "is valid with a name" do
    expect(school).to be_valid
  end
  
end
