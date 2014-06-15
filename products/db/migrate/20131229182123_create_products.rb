class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      #t.string :image_file_name
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
