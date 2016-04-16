class User < ActiveRecord::Base
  has_many :chore_users
  has_many :tasks
  has_many :chores, through: :chore_users
  has_many :purchases

  has_secure_password

  def to_s
    self.name
  end

  def purchase_sum
    self.purchases.sum(:price)
  end

end
