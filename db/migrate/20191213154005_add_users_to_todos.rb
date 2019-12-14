class AddUsersToTodos < ActiveRecord::Migration[6.0]
  def change
    add_reference :todos, :user, foreign_key: true
  end
end
