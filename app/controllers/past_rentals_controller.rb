class PastRentalsController < ApplicationController
  def index
    @pagy, @past_rentals = pagy(PastRental.order(updated_at: :desc))
  end
end