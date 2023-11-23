# frozen_string_literal: true

# added google places service
class GooglePlacesService
  def search_restaurant(query, liked_places)
    client = get_client
    places = client.spots_by_query(query, types: %w[restaurant], serves_lunch: true)

    format_restaurants(places, liked_places)
  end

  private

  def format_restaurants(places, liked_places)
    places.map do |place| 
      {
        id: place['place_id'],
        name: place['name'],
        location: place['formatted_address'],
        photo_url: place['photos'].first&.fetch_url(300) || '',
        favorite: liked_places.include?(place['place_id'])
      }
    end
  end

  def get_client
    GooglePlaces::Client.new(Rails.application.credentials.GOOGLE_API)
  end
end
