class Chore < ActiveRecord::Base
  has_many :tasks
  has_many :users, through: :chore_users
end
