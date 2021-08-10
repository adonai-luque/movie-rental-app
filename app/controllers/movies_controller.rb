class MoviesController < ApplicationController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key
  
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to root_path
  end

  def select_movie_user
    @movie = Movie.find(params[:id])
  end

  def rent
    @movie = Movie.find(params[:id])
    if @movie.rent(params[:user_id])
      redirect_to movies_path
    else
      render :select_movie_user, status: :unprocessable_entity
    end
  end

  def unrent
    @movie = Movie.find(params[:id])
    @movie.unrent

    redirect_to root_path
  end

  private
  
  def movie_params
    params.require(:movie).permit(:id, :name, :director, :category_id, :release_date, :user_id)
  end

  def invalid_foreign_key
    redirect_to movies_path, notice: "Couldn't rent the movie, user doesn't exist"
  end
end
