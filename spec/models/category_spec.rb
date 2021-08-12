require 'rails_helper'

RSpec.describe Category, type: :model do
  it "requires a name to create a category" do
    category = Category.new(name: "Test Name")
    category.valid?
    expect(category.errors.any?).to be(true)
  end
  
  it "requires a name to create a category" do
    category = Category.new(description: "Test description")
    category.valid?
    expect(category.errors.any?).to be(true)
  end
  
  it "can create a category when name and description are provided" do
    category = Category.new(name: "Test Name", description: "Test description")
    category.valid?
    expect(category.errors.any?).to be(false)
  end

  it "creates a category when name and description are provided" do
    category = Category.new(name: "Test Name", description: "Test description")
    category.save
    expect(category.id).to be_a(Integer)
  end
end
