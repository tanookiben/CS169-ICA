# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_address, :class => 'EmailAddresses' do
    callable ""
    label "MyString"
    email "MyString"
  end
end
