class AddCompletionTextToChore < ActiveRecord::Migration
  def change
    add_column :chores, :completion_text, :string
  end
end
