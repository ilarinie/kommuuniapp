class TodoCategory < ActiveRecord::Base
  has_many :todos
  
  validates :name, length: {in:3..20}
  
  def to_s
    self.name
  end
end
