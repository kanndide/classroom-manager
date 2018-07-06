require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user_student) {
    User.create(
      :username => "jsmith",
      :password => "password",
      :email => 5,
    )
  }

  let(:admin) {
    User.create(
      :username => "jsmith",
      :password => "password",
      :email => 5,
      :teacher => false,
      :admin => true
    )
  }

let(:user_teacher) {
    User.create(
      :username => "jsmith",
      :password => "password",
      :email => 5,
      :teacher => true
    )
  }

 let(:user_info) {
     UserInfo.create(
      :first_name => "John",
      :last_name => "Smith",
      :bio => "I am a Junior studying pre-med.",
      :user_id => 1
     )
   }

  it "is valid with a username, password, email" do
    expect(user_student).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(username: "Name")).not_to be_valid
  end

  it "is valid with an admin boolean" do
    expect(admin).to be_valid
  end

  it "is valid with an teacher boolean" do
    expect(user_teacher).to be_valid
  end

  it "defaults to admin => false & teacher => false" do
    expect(user_student.admin).to eq(false)
    expect(user_student.teacher).to eq(false)
  end

end