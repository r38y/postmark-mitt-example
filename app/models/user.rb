class User < ActiveRecord::Base
  validates_presence_of :name, :api_token
  validates_uniqueness_of :api_token
end
