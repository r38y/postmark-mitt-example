require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:api_token) }
  it { should have_many(:posts) }
end
