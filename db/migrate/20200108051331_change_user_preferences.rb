class ChangeUserPreferences < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :preferences, :jsonb, null: false, default: {}
  end
end
