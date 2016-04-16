class User < ActiveRecord::Base
  has_many :chore_users
  has_many :tasks
  has_many :chores, through: :chore_users
  has_many :purchases
  has_many :xps

  has_secure_password

  def to_s
    self.name
  end

  def purchase_sum
    self.purchases.sum(:price)
  end

  def xp_total
    self.xps.sum(:points)
  end

  def xp_total_range from_ago
    self.xps.where("created_at > ?", Time.now-from_ago).sum(:points)
  end

end
