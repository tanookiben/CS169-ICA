# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    type ""
    first_name "MyString"
    last_name "MyString"
    occupation "MyString"
  end
end
