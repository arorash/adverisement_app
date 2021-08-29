class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.string :commenter
      t.string :body
      t.references :advertisement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
