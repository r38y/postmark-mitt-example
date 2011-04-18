class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string  :title,   :null => false
      t.text    :body,    :null => false
      t.integer :user_id, :null => false
      t.string  :message_id
      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :message_id, :unique => true
  end

  def self.down
    drop_table :posts
  end
end
