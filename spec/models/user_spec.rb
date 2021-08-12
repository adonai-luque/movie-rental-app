require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires a name to create a user" do
    user = User.new(email: "test@test.com")
    user.valid?
    expect(user.errors.any?).to be(true)
  end
  
  it "requires an email to create a user" do
    user = User.new(name: "Test Name")
    user.valid?
    expect(user.errors.any?).to be(true)
  end
  
  it "can create a user when name and email are provided" do
    user = User.new(name: "Test Name", email: "test@test.com")
    user.valid?
    expect(user.errors.any?).to be(false)
  end

  it "validates the format of the email" do
    user = User.new(name: "Test Name", email: "testtestcom")
    user.valid?
    expect(user.errors.any?).to be(true)
  end

  it "validates the uniqueness of the email" do
    User.create(name: "Test Name", email: "test@test.com")
    user = User.new(name: "Test Name 2", email: "test@test.com")
    user.valid?
    expect(user.errors.any?).to be(true)
  end

  it "creates a user when name and email are provided" do
    user = User.new(name: "Test Name", email: "test@test.com")
    user.save
    expect(user.id).to be_a(Integer)
  end
end
