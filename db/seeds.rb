User.create!(:name => 'Tyler Durden', :api_token => 'tyler') unless User.exists?(:api_token => 'tyler')
User.create!(:name => 'Robert Paulson', :api_token => 'robert') unless User.exists?(:api_token => 'robert')
