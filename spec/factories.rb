FactoryGirl.define do
  factory :user do
    name "Testaaja"
    username "testaaja"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :purchase do
    price 10
    description "test"
  end

  factory :purchase2 do
    price 20
    description "test"
  end

  factory :chore do
    name "testchore"
    priority 1
    reward 1
  end

  factory :xp do
    points 10
    source "testing"
  end
end
