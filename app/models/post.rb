class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user_id
  default_scope order('created_at DESC')
end
