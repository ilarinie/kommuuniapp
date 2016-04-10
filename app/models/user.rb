class User < ActiveRecord::Base
  has_many :chore_users
  has_many :tasks
  has_many :chores, through: :chore_users

  has_secure_password

  def to_s
    self.name
  end
  
end
