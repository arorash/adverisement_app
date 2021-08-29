class AddPublishStatusToAdvertisements < ActiveRecord::Migration[6.1]
  def change
    add_column :advertisements, :publish_status, :string
  end
end
