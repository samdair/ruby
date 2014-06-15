class SorceryCore < ActiveRecord::Migration
  drop_table :users
  def change
    create_table :users do |t|
      #t.string :username,         :default => nil
      t.string :email,            :default => nil
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end