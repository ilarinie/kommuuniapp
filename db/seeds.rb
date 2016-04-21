# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Default purchase category needed for handling refunds
PurchaseCategory.create! id:1, name:"Refund"
User.create(name:"Adminaccount",username:"admin",password:"admin",password_confirmation:"admin", admin:true, deactivated:false)

# Mock data only used for testing purposes in development
case Rails.env
when "development"
  users = 4
  chores = 5
  purchases = 50
  purchase_categories = 5
  refunds = 5
  xps = 100
  todo_categories = 5
  todos = 30

  (1..users).each do |i|
    User.create! name:Faker::Name.name, username:"test_#{i}", password:"1234", password_confirmation:"1234", deactivated:false
  end

  (1..chores).each do |i|
    Chore.create! name:Faker::Lorem.word, priority:rand(1..170), reward:rand(10..100), private:false, creator_id:rand(1..users)
  end

  (1..purchase_categories).each do |i|
   PurchaseCategory.create! name:Faker::Commerce.department(1, true)
  end

  (1..purchases).each do |i|
    Purchase.create! purchase_category_id:rand(2..purchase_categories), user_id:rand(1..users), price:Faker::Commerce.price, description:Faker::Commerce.product_name, created_at:Faker::Time.between(DateTime.now - 365, DateTime.now)
  end

  (1..xps).each do |i|
    Xp.create! user_id:rand(1..users), points:rand(10..100), created_at:Faker::Time.between(DateTime.now - 365, DateTime.now)
  end
  (1..refunds).each do |i|
    Refund.create! payer_id:rand(1..users), amount:Faker::Commerce.price, receiver_id:rand(1..users), confirmed:false
  end

  (1..todo_categories).each do |i|
    TodoCategory.create! name:Faker::Commerce.department(1, true), priority:rand(1..5)
  end

  (1..todos).each do |i|
    Todo.create! title:Faker::Lorem.word, description:Faker::Lorem.paragraph, todo_category_id:rand(1..todo_categories), creator_id:rand(1..users), due:Faker::Time.between(DateTime.now + 365, DateTime.now), private:[true,false].sample
  end

when "production"

end
