class CreateFavoriteRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :restaurant_id, null: false

      t.timestamps
    end
    add_index :favorite_restaurants, [:user_id, :restaurant_id], unique: true
  end
end
