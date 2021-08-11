class PastRentalsController < ApplicationController
  def index
    @past_rentals = PastRental.all
  end
end