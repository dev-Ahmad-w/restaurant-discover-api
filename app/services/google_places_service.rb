# frozen_string_literal: true

# added google places service
class GooglePlacesService
    def search_restaurant(query)
      client = get_client
      places = client.spots_by_query(query, types: %w[restaurant], serves_lunch: true)
  
      format_restaurants(places)
    end
  
    private
  
    def format_restaurants(places)
      places.map do |place| 
        {
          id: place['place_id'],
          name: place['name'],
          location: place['formatted_address'],
          photo_url: place['photos'].first&.fetch_url(300) || ''
        }
      end
    end
  
    def get_client
      GooglePlaces::Client.new(Rails.application.credentials.GOOGLE_API)
    end
  end
  