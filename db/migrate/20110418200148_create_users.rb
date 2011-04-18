class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :api_token, :null => false
      t.timestamps
    end
    add_index :users, :api_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
