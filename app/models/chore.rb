class Chore < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :users, through: :chore_users
  
  attr_accessor :priorities
  
  validates :name, presence: true, length: { in:2..30 }
  

  def to_s
    self.name
  end
  
  def prioritycalc multiplier
    case multiplier
    when 'hours'
      self.priority = self.priority
    when 'days'
      self.priority = self.priority*24
    when 'weeks'
      self.priority = self.priority*24*7
    end
  end
end
