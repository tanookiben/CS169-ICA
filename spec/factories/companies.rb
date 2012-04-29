# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :educ, class: 'EducationCompany' do
    type "EducationCompany"
    name "MyEducationCompany"
    representative = Person.new({:first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob"})
    representative_role "Education"
  end
  factory :prtf, class: 'PortfolioCompany' do
    type "PortfolioCompany"
    name "MyPortfolioCompany"
    representative = Person.new({:first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob"})
    representative_role "Portfolio"
  end
  factory :prof, class: 'ProfessionalServiceProvider' do
    type "ProfessionalServiceProvider"
    name "MyProfessionalCompany"
    representative = Person.new({:first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob"})
    representative_role "Professional"
  end
end
