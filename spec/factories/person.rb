FactoryGirl.define do
  factory :person do
    first_name 'John'
    last_name 'Doe'
    occupation 'Missing'
  end

  factory :individual, :parent => :person, :class => 'Individual' do
  end

  factory :board_member, :parent => :person, :class => 'BoardMember' do
  end

  factory :advisor, :parent => :person, :class => 'Advisor' do
  end
end
