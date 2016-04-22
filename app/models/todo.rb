class Todo < ActiveRecord::Base
  has_many :todo_users
  has_one :todo_solution
  has_many :todo_comments
  belongs_to :todo_category
  
  validates :title, length: {in: 3..50 }


  self.per_page = 10

end
