class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :user_id, :integer, index: true
    add_column :visits, :short_url_id, :integer, index: true
  end
end
