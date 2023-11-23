require 'rails_helper'

RSpec.describe FavoriteRestaurantsController, type: :controller do
  let(:user) { create(:user) }
  let(:favorite_restaurant) { create(:favorite_restaurant) }

  before do
    sign_in user
  end

  describe '#toggle_favorite' do
    context 'when liking a restaurant' do
      it 'allows a user to like a restaurant' do
        post :toggle_favorite, params: { id: favorite_restaurant.restaurant_id } , xhr: true

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('favorite')
        expect(user.favorite_restaurants.pluck(:restaurant_id)).to include(favorite_restaurant.restaurant_id)
      end
    end

    context 'when unliking a restaurant' do
      before { user.favorite_restaurants.create(restaurant_id: favorite_restaurant.restaurant_id ) }

      it 'allows a user to unlike a restaurant' do
        post :toggle_favorite, params: { id: favorite_restaurant.restaurant_id }
        
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('unfavorite')
        expect(user.favorite_restaurants.pluck(:restaurant_id)).not_to include(favorite_restaurant.restaurant_id)
      end
    end
  end

  describe '#search' do
    context 'when user is authenticated' do
      it 'returns a success response' do
        post :search, params: { query: 'Santa Clara' }

        expect(response).to be_successful
      end
    end

    context 'when user is not authenticated' do
      it 'returns an unauthorized response' do
        sign_out user

        post :search, params: { query: 'Santa Clara' }
        
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('You need to sign in or sign up')
      end
    end
  end
end  
