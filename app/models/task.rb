class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore
  
  validates :chore_id, presence: true
  validates :user_id, presence: true
end
