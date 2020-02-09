class AddIncompleteOrderToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :incomplete_order, :integer, array: true, default: [], null: false
  end
end
