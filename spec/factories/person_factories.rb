FactoryGirl.define do
  factory :person do |p|
    p.first_name 'John'
    p.last_name 'Doe'
    p.occupation 'Missing'
  end
end
