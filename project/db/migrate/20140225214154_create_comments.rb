class CreateComments < ActiveRecord::Migration
  drop_table :comments
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :name
      t.string :email
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
