class Chore < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :users, through: :chore_users
  
  attr_accessor :priorities
  
  validates :name, presence: true, length: { in:2..30 }
  

  def to_s
    self.name
  end
end
