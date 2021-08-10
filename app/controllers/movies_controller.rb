class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  
  def index
    @movies = Movie.all
  end
  
  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:id, :name, :director, :category_id, :release_date, :user_id)
  end

end
