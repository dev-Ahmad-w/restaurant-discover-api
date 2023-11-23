class FavoriteRestaurantsController < ApplicationController
  before_action :authenticate_user!

  def search
    query = params[:query] || 'lunch'
    places = GooglePlacesService.new.search_restaurant(query)
    
    render json: places, status: :ok
  end
end
