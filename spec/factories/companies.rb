# Read about factories at https://github.com/thoughtbot/factory_girl

require Rails.root.join("spec/factories/people.rb")

FactoryGirl.define do
  factory :educ, class: 'EducationCompany' do
    type "EducationCompany"
    name "MyEducationCompany"
    representative = FactoryGirl.create(:individual)
    representative_role "Education"
  end
  factory :prtf, class: 'PortfolioCompany' do
    type "PortfolioCompany"
    name "MyPortfolioCompany"
    representative = FactoryGirl.create(:individual, { :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob"})
    representative_role "Portfolio"
  end
  factory :prof, class: 'ProfessionalServiceProvider' do
    type "ProfessionalServiceProvider"
    name "MyProfessionalCompany"
    representative = FactoryGirl.create(:individual, { :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob"})
    representative_role "Professional"
  end
end
