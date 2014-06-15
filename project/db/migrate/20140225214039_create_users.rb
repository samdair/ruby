class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
