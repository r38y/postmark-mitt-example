# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.name "MyString"
  f.api_token {Factory.next :api_token}
end

Factory.sequence :api_token do |n|
  "token#{n}"
end
