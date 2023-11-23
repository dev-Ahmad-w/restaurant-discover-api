class FavoriteRestaurantsController < ApplicationController
  before_action :authenticate_user!

  def search
    places = GooglePlacesService.new.search_restaurant(params[:query], current_user.favorite_restaurants.pluck(:restaurant_id))
    
    render json: places, status: :ok
  rescue StandardError => e
    render json: { error: "Error fetching Restaurant: #{e.message}" }, status: :unprocessable_entity
  end

  def toggle_favorite
    restaurant_id = params[:id]

    liked_restaurant = current_user.favorite_restaurants.find_by(restaurant_id: restaurant_id)

    message = if liked_restaurant.present?
                liked_restaurant.destroy
                "marked as unfavorite"
              else
                current_user.favorite_restaurants.create(restaurant_id: restaurant_id)
                "marked as favorite"
              end

    render json: { message: "Restaurant #{message} successfully" }, status: :ok
  end
end
