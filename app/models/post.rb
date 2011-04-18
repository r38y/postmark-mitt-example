class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user_id
  default_scope order('created_at DESC')

  def self.create_from_postmark(mitt)
    api_token = mitt.to.split("@").first.split("+").last
    user = User.find_by_api_token(api_token)
    if user
      post = user.posts.new
      post.message_id = mitt.message_id
      post.title      = mitt.subject
      post.body = if mitt.text_body.blank?
        mitt.html_body
      else
        mitt.text_body
      end
      # post.photo = mitt.attachments.first.read unless mitt.attachments.empty?
      post.save
    else
      return false
    end
  end
end
