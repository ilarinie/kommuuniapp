class Chore < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :users, through: :chore_users

  attr_accessor :priorities

  validates :name, presence: true, length: { in: 2..30 }

  scope :pub, -> { where.not(private:true)}

  def to_s
    name
  end

  def prioritycalc(multiplier)
    case multiplier
    when 'hours'
      self.priority = priority
    when 'days'
      self.priority = priority * 24
    when 'weeks'
      self.priority = priority * 24 * 7
    end
  end

  def add_to_every_user
    User.active.each do |user|
      ChoreUser.create(user_id: user.id, chore_id: id)
    end
  end

  def weekly_average_task_count
    weeks = ((Time.now - created_at) / 1.week.seconds)
    weeks = 1 if weeks < 1
    if !tasks.empty?
      '%.2f' % (tasks.count / weeks)
    else
      0
    end
  end

  def telegram_message user
    if self.completion_text.nil?
      ""+user.to_s+" has just finished "+self.name+""
    else
      ""+user.to_s+" "+self.completion_text
    end
  end

  def complete user
    task  = Task.new(chore_id:self.id, user_id:user.id)
    if task.save
      if not self.private
        TelegramApi.send_to_channel telegram_message(user)
        xp = Xp.create source:"Chore: "+task.chore.name, points:task.chore.reward
        user.xps << xp
      end
      true
    else
      false
    end
  end

  def sort_users_by_task_count
    @users = User.active
    maarat = {}
    @users.each do |user|
      maarat[user.id] = Task.where(user_id:user.id, chore_id:self.id).count
    end
    maarat.sort_by {|k,v| v}.reverse
  end


end
