class AddPreferencesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :preferences, :jsonb, null: false, default: {}
  end
end
