class RentsController < ApplicationController
  def index
    @rents = Rent.all
  end

  def show
    @rent = Rent.find(params[:id])
  end
  
  def new
    @rent = Rent.new
    @rent.movie_id = params[:movie_id]
  end

  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @rent = Rent.find(params[:id])
  end

  def update
    @rent = Rent.find(params[:id])

    if @rent.update(rent_params)
      redirect_to @rent
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    redirect_to root_path
  end

  private
  
  def rent_params
    params.require(:rent).permit(:id, :movie_id, :user_id)
  end
end
