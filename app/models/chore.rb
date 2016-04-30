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

  def add_to_every_user
    User.active.each do |user|
      ChoreUser.create(user_id:user.id, chore_id:self.id)
    end
  end

  def weekly_average_task_count
   weeks = ((Time.now - self.created_at) / 1.week.seconds)
   weeks = 1 if weeks < 1
    if not self.tasks.empty?
  '%.2f' % (self.tasks.count / weeks )
  else
  0
  end
  end

end
