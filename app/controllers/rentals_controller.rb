class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end
  
  def new
    @rental = Rental.new
    @rental.movie_id = params[:movie_id]
  end

  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])

    if @rental.update(rental_params)
      redirect_to @rental
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    redirect_to root_path
  end

  private
  
  def rental_params
    params.require(:rental).permit(:id, :movie_id, :user_id)
  end
end
