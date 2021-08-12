require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "can't create a movie without an existing category" do
    movie = Movie.new(name: "Movie Name", director: "Movie Director", category_id: 1, release_date: "1980-05-05")
    movie.valid?
    expect(movie.errors.any?).to be(true)
  end
  
  it "can create a movie with all the fields provided and an existing category" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.new(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    movie.valid?
    expect(movie.errors.any?).to be(false)
  end

  it "creates a movie with all the fields provided and an existing category" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.new(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    movie.save
    expect(movie.id).to be_a(Integer)
  end
  
  it "requires a name to create a movie" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.new(director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    movie.valid?
    expect(movie.errors.any?).to be(true)
  end

  it "requires a director to create a movie" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.new(name: "Movie Name", category_id: category.id, release_date: "1980-05-05")
    movie.valid?
    expect(movie.errors.any?).to be(true)
  end

  it "requires a release_date to create a movie" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.new(name: "Movie Name", director: "Movie Director", category_id: category.id)
    movie.valid?
    expect(movie.errors.any?).to be(true)
  end

  it "has a method rented? to check its status" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    expect(movie.respond_to?(:rented?)).to be(true)
  end

  it "has a method user_id to check who has rented it" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    expect(movie.respond_to?(:user_id)).to be(true)
  end

  it "has rentals" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    user = User.create(name: "Test Name", email: "test@test.com")
    rental = Rental.create(movie_id: movie.id, user_id: user.id)
    expect(movie.rentals.any?).to be(true)
  end

  it "has users through rentals" do
    category = Category.create(name: "Test Name", description: "Test description")
    movie = Movie.create(name: "Movie Name", director: "Movie Director", category_id: category.id, release_date: "1980-05-05")
    user = User.create(name: "Test Name", email: "test@test.com")
    rental = Rental.create(movie_id: movie.id, user_id: user.id)
    expect(movie.users.any?).to be(true)
  end
end
