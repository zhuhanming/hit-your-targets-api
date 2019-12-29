class AddCompleteTimeToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :complete_time, :datetime
  end
end
