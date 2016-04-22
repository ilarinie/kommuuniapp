class User < ActiveRecord::Base
  has_many :chore_users
  has_many :tasks
  has_many :chores, through: :chore_users
  has_many :purchases
  has_many :xps, dependent: :destroy
  has_many :todo_users
  has_many :todos, through: :todo_users
  
  validates :username, uniqueness: true, length: { minimum: 3 }
  validates_format_of :password, with: /(?=.*[A-Z])(?=.{4,}).+/, on :update
  validates :name, length: {minimum: 3}

  scope :active, -> { where deactivated:[nil,false]}
  scope :deactivated, -> { where deactivated:true }

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
    self.xps.where("created_at > ?", from_ago).sum(:points)
  end

end
