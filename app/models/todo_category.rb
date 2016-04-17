class TodoCategory < ActiveRecord::Base
  has_many :todos

  def to_s
    self.name
  end
end
