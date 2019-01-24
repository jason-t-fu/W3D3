class RemoveReferences < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:visits, :user, index: true, foreign_key: true)
    remove_reference(:visits, :shortened_url, index: true, foreign_key: true)
  end
end
