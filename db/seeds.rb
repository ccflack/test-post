# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@users = Array.new

10.times do

@users << User.create(
  username: Faker::GameOfThrones.character
)

end

10.times do

post = Post.create(
  title: Faker::Hacker.say_something_smart,
  url: Faker::Internet.url,
  vote_count: rand(1..100),
  user: @users.sample
)

end
