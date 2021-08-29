class AddAdIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :ad_id, :integer
    add_index :comments, :ad_id
  end
end
