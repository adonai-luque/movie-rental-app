class RentalsController < ApplicationController
  def index
    @pagy, @rentals = pagy(Rental.order(updated_at: :desc))
  end

  def show
    @rental = Rental.find(params[:id])
  end
  
  def new
    @rental = Rental.new
    @rental.movie_id = params[:movie_id]
    @rental.user_id = params[:user_id]
    $new_rental_referer = params[:referer]
  end

  def create
    @rental = Rental.new(rental_params)
    
    if @rental.save
      redirect_to "/#{$new_rental_referer}", notice: ExternalService.send_rental(@rental) ? "Rental successfully created and rental data sent to and received by External Service" : "Rental successfully created. External Service didn't respond"
    else
      render :new, status: :unprocessable_entity, notice: "The rental couldn't be created"
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])

    if @rental.update(rental_params)
      redirect_to @rental, notice: ExternalService.send_rental(@rental) ? "Rental successfully updated and rental data sent to and received by External Service" : "Rental successfully updated. External Service didn't respond"
    else
      render :edit, status: :unprocessable_entity, notice: "The rental couldn't be updated"
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    destroy_rental_referer = params[:referer]
    PastRental.create(movie_id: @rental.movie_id, user_id: @rental.user_id, rental_date: @rental.created_at)
    case destroy_rental_referer
    when "movies"
      redirect_to movies_path, notice: "Movie successfully returned" if @rental.destroy 
    when "rentals"
      redirect_to rentals_path, notice: "Rental successfully ended" if @rental.destroy 
    else
    end
  end

  private
  
  def rental_params
    params.require(:rental).permit(:id, :movie_id, :user_id, :referer)
  end
end
