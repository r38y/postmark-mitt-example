class User < ActiveRecord::Base
  validates_presence_of :name, :api_token
  validates_uniqueness_of :api_token

  has_many :posts

  def self.gen_token(size=10)
    raise ArgumentError, "size can't be greater than 40" if size > 40
    Digest::SHA1.hexdigest([Time.now.to_s, (1..10).map{ rand.to_s }].flatten.join('--'))[0, size]
  end
end
