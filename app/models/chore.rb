class Chore < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :users, through: :chore_users

  def to_s
    self.name
  end
end
