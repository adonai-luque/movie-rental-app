class RentalsController < ApplicationController
  def index
    @pagy, @rentals = pagy(Rental.all)
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
      redirect_to root_path, notice: ExternalService.send_rental(@rental) ? "Rental successfully created and rental data sent to and received by External Service" : "Rental created successfully. External Service didn't respond"
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
      redirect_to @rental, notice: "Rental successfully updated"
    else
      render :edit, status: :unprocessable_entity, notice: "The rental couldn't be updated"
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    PastRental.create(movie_id: @rental.movie_id, user_id: @rental.user_id, rental_date: @rental.created_at)
    redirect_to root_path, notice: "Movie successfully returned" if @rental.destroy 
  end

  private
  
  def rental_params
    params.require(:rental).permit(:id, :movie_id, :user_id)
  end
end
