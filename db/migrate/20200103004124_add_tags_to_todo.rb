class AddTagsToTodo < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :tags, :text, array: true, default: [], null: false
  end
end
