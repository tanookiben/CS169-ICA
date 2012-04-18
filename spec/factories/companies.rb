# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company, class: 'Company' do
    name "MyString"
    representative = Person.new({ :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob", :type => "Individual" })
    representative_role "MyString"
  end
end
