class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user_id
  default_scope order('created_at DESC')

  def self.create_from_postmark(mitt)
    api_token = mitt.to.split("@").first.split("+").last
    user = User.find_by_api_token(api_token)
    if user
      post = user.post.new
      post.message_id = mitt.message_id
      post.title      = mitt.subject
      post.body       = mitt.body
      post.save
    else
      return false
    end
  end
end
