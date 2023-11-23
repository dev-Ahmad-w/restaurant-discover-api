class FavoriteRestaurant < ApplicationRecord
  belongs_to :user
  
  validates :user, presence: { message: 'must be associated' }
  validates :restaurant_id, presence: { message: 'can\'t be blank' }
end
