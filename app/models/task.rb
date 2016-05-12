class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore

  validates :chore_id, presence: true
  validates :user_id, presence: true

  scope :publicc, -> { where !self.chore.private}


  self.per_page = 10


  def to_s

    ""+self.user.to_s+" finished "+self.chore.to_s
  end
end
