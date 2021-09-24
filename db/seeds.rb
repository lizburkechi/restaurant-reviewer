# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

restaurants = Restaurant.create!([
    {
        name: "Pizza Papi",
        image_url: "https://www.pexels.com/photo/pizza-papi-restaurant-2086176/",
    },
    {
        name: "The District Party Bar & Grill",
        image_url: "https://www.pexels.com/photo/court-center-store-2919579/",
    },
    {
        name: "Trattoria",
        image_url: "https://www.pexels.com/photo/display-window-of-a-restaurant-6192571/",
    },
    {
        name: "Flo's Cafe",
        image_url: "https://www.pexels.com/photo/low-angle-photo-of-flo-s-v8-cafe-signage-2670269/",
    },
    {
        name: "Pier Burger",
        image_url: "https://www.pexels.com/photo/fast-food-restaurant-and-famous-road-sign-against-overcast-evening-sky-6039252/",
    },
    {
        name: "Chicago Diner",
        image_url: "https://www.pexels.com/photo/woman-lowers-her-sunglasses-2885917/"
    }
])

reviews = Review.create!([
    {
        title: 'Great Food!',
        description: 'Seating was quick, service was on par.',
        score: 5,
        restaurant: restaurants.first
    },
    {
        title: 'Terrible Restaurant',
        description: 'Food was awful and everything was dirty.',
        score: 1,
        restaurant: restaurants.first
    }
])

puts "🌱🌱🌱"