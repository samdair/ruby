class CreateArticles < ActiveRecord::Migration
 
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.string :image
      t.string :author
      t.text :body
      t.datetime :published_at
      
      t.timestamps
    end
  end
end
