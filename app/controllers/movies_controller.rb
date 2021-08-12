class MoviesController < ApplicationController
  def index
    $new_rental_referer = nil
    @pagy, @movies = pagy(Movie.all)
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
      redirect_to @movie, notice: "Movie successfully created"
    else
      render :new, status: :unprocessable_entity, notice: "The movie couldn't be created"
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated"
    else
      render :edit, status: :unprocessable_entity, notice: "The movie couldn't be updated"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, notice: "Movie successfully deleted"
  end

  private
  
  def movie_params
    params.require(:movie).permit(:id, :name, :director, :category_id, :release_date)
  end
end
