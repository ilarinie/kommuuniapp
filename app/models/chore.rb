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

  def priority_to_s
    if self.priority < 24
      "#{self.priority} hours"
    elsif self.priority < 168
    '%.1f' % (self.priority/24.0) +" days"
    else
    '%.2f' % (self.priority/168) +" weeks"
    end
  end

end
