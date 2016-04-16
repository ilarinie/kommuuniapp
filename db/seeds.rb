# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = 4
chores = 5
purchases = 50
purchase_categories = 5
xps = 100

(1..users).each do |i|
  User.create! name:Faker::Name.name, username:"test_#{i}", password:"1234", password_confirmation:"1234"
end

(1..chores).each do |i|
  Chore.create! name:Faker::Lorem.word, priority:rand(1..170), reward:rand(10..100), private:false, creator_id:1
end

(1..purchase_categories).each do |i|
 PurchaseCategory.create! name:Faker::Commerce.department(1, true)
end

(1..purchases).each do |i|
  Purchase.create! purchase_category_id:rand(1..5), user_id:rand(1..4), price:Faker::Commerce.price, description:Faker::Commerce.product_name, created_at:Faker::Time.between(DateTime.now - 365, DateTime.now)
end

(1..xps).each do |i|
  Xp.create! user_id:rand(1..4), points:rand(10..100), created_at:Faker::Time.between(DateTime.now - 365, DateTime.now)
end
