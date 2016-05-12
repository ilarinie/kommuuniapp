class TodoSolution < ActiveRecord::Base
  belongs_to :todo
  belongs_to :user


    scope :pub, ->(){
      joins(:todo).where('todos.private' => false)
    }

  def to_s
    ""+self.user.to_s+" solved "+self.todo.title
  end

  def url
    "todos/"+self.todo_id.to_s
  end
end
