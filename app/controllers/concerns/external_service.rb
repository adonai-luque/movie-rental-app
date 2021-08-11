require "http"

module ExternalService
  def self.send_rental(rental)
    puts "Sending rental data to External Service"
    movie_id = rental.movie_id
    movie_name = Movie.find(rental.movie_id).name
    user_id = rental.user_id
    user_name = User.find(rental.user_id).name
    rental_date = rental.created_at
    response = HTTP.post("https://jsonplaceholder.typicode.com/posts", :form => {'movie_id' => movie_id, 'movie_name' => movie_name, 'user_id' => user_id, 'user_name' => user_name, 'rental_date' => rental_date})
    puts "Rental data succesfully delivered to External Service" if response.status.to_s == "201 Created"
    puts "Status: #{response.status}"
    p response.parse
  end
end