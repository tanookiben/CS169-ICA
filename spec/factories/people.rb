# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :individual, class: 'Individual' do
    type "Individual"
    first_name "MyString"
    last_name "MyString"
    occupation "MyString"
  end
  factory :advisor, class: 'Advisor' do
    type "Advisor"
    first_name "MyString"
    last_name "MyString"
    occupation "MyString"
  end
  factory :boardmember, class: 'BoardMember' do
    type "BoardMember"
    first_name "MyString"
    last_name "MyString"
    occupation "MyString"
  end
end
