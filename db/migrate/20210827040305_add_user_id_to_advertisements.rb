class AddUserIdToAdvertisements < ActiveRecord::Migration[6.1]
  def change
    add_column :advertisements, :user_id, :integer
    add_index :advertisements, :user_id
  end
end
