# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PHONE_LABELS = ['Mobile', 'Business', 'Other', 'Home']

INDIVIDUALS = [
  {:first_name => 'Mike', :last_name => 'Vermillion', :occupation => 'Harvest Manager'},
  {:first_name => 'Gregory', :last_name => 'Topping', :occupation => 'Fire Sprinkler Installer'},
  {:first_name => 'Tammy', :last_name => 'Ellinger', :occupation => 'Fish and Wildlife Warden'},
  {:first_name => 'William', :last_name => 'Sandler', :occupation => 'Oxygen Therapy Technician'},
  {:first_name => 'Steve', :last_name => 'Cook', :occupation => 'Bar Back'},
  {:first_name => 'Isabel', :last_name => 'Crabb', :occupation => 'Applied Psychology Professor'},
  {:first_name => 'Beth', :last_name => 'Chisholm', :occupation => 'Body and Frame Technician'},
  {:first_name => 'Ann', :last_name => 'Bell', :occupation => 'Piano Tuner'},
  {:first_name => 'Jimmy', :last_name => 'Ferraro', :occupation => 'Office Clerk'},
  {:first_name => 'Erica', :last_name => 'Lovell', :occupation => 'Public Relations Officer'},
  {:first_name => 'Norman', :last_name => 'Emery', :occupation => 'Locomotive Inspector'},
  {:first_name => 'Margaret', :last_name => 'Darby', :occupation => 'Karate Instructor'},
  {:first_name => 'Barbara', :last_name => 'Theisen', :occupation => 'Flight Communications Operator'},
  {:first_name => 'Louis', :last_name => 'Bates', :occupation => 'Photojournalist'},
  {:first_name => 'Julia', :last_name => 'Herman', :occupation => 'Oceanographer'},
]

BOARDMEMBERS = [
  {:first_name => 'Gerald', :last_name => 'Lemaster', :occupation => 'Clerk Typist'},
  {:first_name => 'Bruce', :last_name => 'Desai', :occupation => 'Loan Teller'},
]

ADVISORS = [
  {:first_name => 'Melanie', :last_name => 'Kindred', :occupation => 'Radiation Engineer'},
  {:first_name => 'Nathan', :last_name => 'Cortes', :occupation => 'Wildlife Veterinarian'}
]

EDUCATIONCOMPANIES = [
  {:name => 'Translation Renderers', :representative_id => '1', :representative_role => 'Secretary'},
  {:name => 'Helpful Sows', :representative_id => '2', :representative_role => 'Warden'}
]

PORTFOLIOCOMPANIES = [
  {:name => 'Key Community Inc.', :representative_id => '3', :representative_role => 'Manager'},
  {:name => 'Total Information', :representative_id => '4', :representative_role => 'Supervisor'}
]

PROFESSIONALSERVICEPROVDERS = [
  {:name => 'Network Community', :representative_id => '5', :representative_role => 'Manager'},
  {:name => 'Indicative Data', :representative_id => '6', :representative_role => 'Supervisor'}
]

PHONE_NUMBER_GENERATOR = Random.new

INDIVIDUALS.each do |i|
  Individual.create(i)
end

BOARDMEMBERS.each do |bm|
  BoardMember.create(bm)
end

ADVISORS.each do |a|
  Advisor.create(a)
end

EDUCATIONCOMPANIES.each do |ec|
  EducationCompany.create(ec)
end

PORTFOLIOCOMPANIES.each do |pc|
  PortfolioCompany.create(pc)
end

PROFESSIONALSERVICEPROVDERS.each do |psp|
  ProfessionalServiceProvider.create(psp)
end

Person.all.each do |p|
  p.create_phone_number(:label => PHONE_LABELS[rand(4)], :number => PHONE_NUMBER_GENERATOR.rand(1000000000..4294967295))
end

Company.all.each do |c|
  c.create_phone_number(:label => PHONE_LABELS[rand(3)], :number => PHONE_NUMBER_GENERATOR.rand(1000000000..4294967295))
end
