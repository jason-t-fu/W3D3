class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user
      t.integer :short_url

      t.timestamps
    end
    add_reference :visits, :user, foreign_key: true, index: true
    add_reference :visits, :shortened_url, foreign_key: true, index: true
  end
end
