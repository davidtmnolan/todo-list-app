class AddUserIdToTodoLists < ActiveRecord::Migration
  def up
		add_column :todo_lists, :user_id, :integer
		add_index :todo_lists, :user_id
  end
	

end
