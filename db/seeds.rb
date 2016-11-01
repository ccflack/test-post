# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@users = []

10.times do

@users << User.create!(
  username: Faker::Internet.user_name + "#{rand(1..1000)}",
  email_address: Faker::Internet.email,
  password: "admin"
)

end

@categories = []


5.times do

@categories << Category.create!(
  title: Faker::GameOfThrones.city
)

end

@posts = []

10.times do

@posts << Post.create!(
  title: Faker::Hacker.say_something_smart,
  url: Faker::Internet.url,
  user: @users.sample,
  category: @categories.sample
)

end

250.times do

  Vote.create!(
    post: @posts.sample,
    user: @users.sample
  )
end
