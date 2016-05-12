class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore

  validates :chore_id, presence: true
  validates :user_id, presence: true

  scope :pub, ->(){
    joins(:chore).where('chores.private' => false)
  }

  def url
    "chores/"+self.chore_id.to_s
  end



  self.per_page = 10

  def to_s

    ""+self.user.to_s+" finished "+self.chore.to_s
  end
end
