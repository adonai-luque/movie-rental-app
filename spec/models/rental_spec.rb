require 'rails_helper'

RSpec.describe Rental, type: :model do
  it "requires a movie_id to create a rental" do
    user = User.create(name: "Test Name", email: "test@test.com")
    rental = Rental.new(user_id: user.id)
    rental.valid?
    expect(rental.errors.any?).to be(true)
  end
  
  it "requires a user_id to create a rental" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    rental = Rental.create(movie_id: movie.id)
    expect(rental.errors.any?).to be(true)
  end
  
  it "can create a rental when movie_id and user_id are provided" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    user = User.create(name: "Test Name", email: "test@test.com")
    rental = Rental.new(movie_id: movie.id, user_id: user.id)
    rental.valid?
    expect(rental.errors.any?).to be(false)
  end

  it "creates a rental when movie_id and user_id are provided" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    user = User.create(name: "Test Name", email: "test@test.com")
    rental = Rental.new(movie_id: movie.id, user_id: user.id)
    rental.save
    expect(rental.id).to be_a(Integer)
  end

  it "validates the uniqueness of the movie_id" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    one_user = User.create(name: "Test Name", email: "test@test.com")
    another_user = User.create(name: "Test Name", email: "test@test.com")
    first_rental = Rental.create(movie_id: movie.id, user_id: one_user.id)
    second_rental = Rental.new(movie_id: movie.id, user_id: another_user.id)
    second_rental.valid?
    expect(second_rental.errors.any?).to be(true)
  end
end
