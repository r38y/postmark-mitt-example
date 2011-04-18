class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # make sure the thing posting has rights to post here... maybe with
    # http basic auth or a super secret token

    Post.create_from_postmark(Postmark::Mitt.new(request.body.read))

    # do a bunch of stuff like send an email back if the user can't be
    # found, doesn't exist, etc.

    render :text => "Created a post!", :status => :created
  end
end
