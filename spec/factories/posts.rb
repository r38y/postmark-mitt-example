# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.title "MyString"
  f.body "MyText"
  f.user {Factory(:user)}
  f.message_id {Factory.next :message_id}
end
Factory.sequence :message_id do |n|
  "message_id#{n}"
end
