# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.destroy_all
Meal.destroy_all
Review.destroy_all

DEFAULT_PASSWORD = "123"
INGREDIENTSARR = ["Bacon", "Beef fat", "Butter", "Chicken fat", "Cocoa butter", "Coconut or coconut oil", "Hydrogenated fats and oils", "Lard", "Palm or palm kernel oil", "Baking powder", "Baking soda", "Brine", "Celery salt", "Garlic salt", "Brown sugar", "Cane juice extract", "Corn syrup", "Honey", "Invert sugar", "Lactose", "Liquid sugar", "Maltos", "Chicken", "Pork", "Lamb", "Shrimp", "Fish", "Peanut", "Bea", "Banana", "Apple", "Ginger"]

20.times do |n|
    username = Faker::Name.first_name
    User.create(
        username: username,
        email: "#{username}@example.com",
        profile_img_url: "https://picsum.photos/200",
        password: DEFAULT_PASSWORD,
        is_cook: true
    )
end

users = User.all

40.times do |n|
    
    meal = Meal.create(
        title: Faker::Food.dish,
        description: Faker::Food.description,
        ingredients: INGREDIENTSARR.sample(rand(2..10)).join(","),
        img_url: "https://picsum.photos/200",
        price: Faker::Commerce.price,
        user: users.sample
    )

    if meal.valid?
        rand(1..5).times do
            rating = rand(1..5)
            review = Review.create(
                rating: rating,
                body: Faker::Lorem.paragraph(sentence_count: 5),
                meal: meal,
                user: users.sample
            )
        end
    end
end


20.times do |n|
    username = Faker::Name.first_name
    User.create(
        username: username,
        email: "#{username}@example.com",
        profile_img_url: "https://picsum.photos/200",
        password: DEFAULT_PASSWORD,
        is_cook: false
    )
end

users = User.all
meals = Meal.all
reviews = Review.all

p "Create #{users.count} users, #{meals.count} meal and #{reviews.count} reviews."