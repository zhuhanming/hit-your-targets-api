class AddCompleteOrderToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :complete_order, :integer, array: true, default: [], null: false
  end
end
