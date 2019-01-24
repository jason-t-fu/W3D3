class UpdateForeignKeys < ActiveRecord::Migration[5.2]
  def change
    change_column_null :visits, :user_id, false
    change_column_null :visits, :short_url_id, false

    add_index :visits, :user_id
    add_index :visits, :short_url_id
  end
end
