class AddDisplayImageUrlToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :display_image_url, :string
  end
end
