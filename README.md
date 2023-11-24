# Restaurant Discovery API
​
## Overview
This Restaurant Discovery API is designed to simplify the process of finding great places to eat lunch. Leveraging the Google Places API. The API is implemented using Ruby on Rails and can be easily deployed using Docker.
​
## Features
- **Data Source**: Utilizes the Google Places API.
- **Endpoint**:
- `POST /favorite_restaurants/search` which returns an array of search results.
- `POST /favorite_restaurants/:id/toggle_favorite` which likes or unlikes the restaurant. If already like it will unlike the restaurant and vise versa. 
- **Response Details**: Includes basic information like place_id, restaurant name, location, and photo URL and favorite which is a boolean which return true if you have like it and vise versa.
​
## Bonus Features
- **Favorites**: Allows marking restaurants as favorites and shows favorite status in responses.
- **Testing**: Includes controller and model test cases using RSpec.
​
## Project Setup
### Dependencies
- Ruby 2.6.3
- Rails 6.0.0
- PostgreSQL


### Prerequisites
- Docker
- Docker Compose (for local development)
​
### Building and Running with Docker
1. **Clone the Repository:** `git clone [repository-url]`
2. **Navigate to the Project Directory:** `cd [project-directory]`
3. **Build the Docker Image:** `docker-compose up --build`
4. **Run the Docker Container:** `docker run -p 8000:8000 restaurant-discovery-api`
5. **Access the API:** The API will be available at `http://localhost:3000`.
​
### Using the API
- **Authenticate**
- Use the provided credentials or register a new user.
- **Search for Restaurants**
- Send a `POST` request to `/favorite_restaurants/search` with relevant parameters.
- Send a `POST` request to `/favorite_restaurants/:id/toggle_favorite` with relevant parameters.
​
## Testing
Run the test suite using `rspec` or your chosen testing framework to ensure all features are working as expected.
​