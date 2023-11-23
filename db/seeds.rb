user1 = User.create( email: 'example@gmail.com', password: 'pass123' )
user2 = User.create( email: 'example1@gmail.com', password: 'pass123' )

user1.favorite_restaurant.create( restaurant_id: 'ChIJDXRaF-7Jj4ARP7pAVdmdxH4' )
user1.favorite_restaurant.create( restaurant_id: 'ChIJeYLDGe7Jj4ARTAWJla0ERHs' )