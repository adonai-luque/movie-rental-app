class PastRentalsController < ApplicationController
  def index
    @pagy, @past_rentals = pagy(PastRental.all)
  end
end