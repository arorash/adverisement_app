class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment_by
      t.string :comment_text

      t.timestamps
    end
  end
end
