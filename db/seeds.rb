User.create!(:name => 'Tyler Durden', :api_token => 'tyler') unless User.exists?(:api_token => 'tyler')
