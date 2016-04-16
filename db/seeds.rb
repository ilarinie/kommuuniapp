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

(1..users).each do |i|
  User.create! username:"test_#{i}", password:"1234", password_confirmation:"1234"
end

(1..chores).each do |i|
  Chore.create! name:"chore_#{i}", priority:rand(1..170), reward:rand(10..100), private:false, creator_id:1
end

PurchaseCategory.create! name:"Food"

PurchaseCategory.create! name:"Stuff"

(1..purchases).each do |i|
  Purchase.create! purchase_category_id:rand(1..2), user_id:rand(1..4), price:rand()*1000
end
