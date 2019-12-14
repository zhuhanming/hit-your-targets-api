class CreateSubtodos < ActiveRecord::Migration[6.0]
  def change
    create_table :subtodos do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :completed
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
