class DeleteVisitColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :visits, :user
    remove_column :visits, :short_url
  end
end
