require 'faker'
FactoryGirl.define do

  factory :user do
    name "Testaaja"
    username { Faker::Internet.user_name}
    password "12345678"
    password_confirmation "12345678"
  end

  factory :purchase do
    description "testpurchase"
    price 10
  end

  factory :purchase_category do
    name "purchase_category_test"
  end

  factory :todo do
    title "testtodo"
    description "desc"
    private false
    due {DateTime.now+3.days}

    end

  factory :refund do
    amount 10
  end



  factory :xp do
    points 10
    source "testing"
  end
end
