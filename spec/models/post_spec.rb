require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }

  it "should order posts by created_at DESC" do
    post1 = Factory(:post, :created_at => 3.days.ago)
    post2 = Factory(:post, :created_at => 2.days.ago)
    Post.all.map(&:id).should == [post2.id, post1.id]
  end
end
