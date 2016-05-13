class TodoCategory < ActiveRecord::Base
  has_many :todos

    validates :name, presence: true, length: { in: 2..30 }

  def to_s
    self.name
  end
end
