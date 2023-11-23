require 'rails_helper'

RSpec.describe FavoriteRestaurant, type: :model do
  describe 'validations' do
    it { should belong_to(:user).class_name('User') }

    it { should validate_presence_of(:user).with_message('must be associated') }
    it { should validate_presence_of(:restaurant_id).with_message("can't be blank") }
  end
end
