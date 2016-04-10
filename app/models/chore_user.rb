class ChoreUser < ActiveRecord::Base
  belongs_to :chore
  belongs_to :user
end
