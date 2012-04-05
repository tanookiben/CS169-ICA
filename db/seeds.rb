# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
  {:first_name => 'Larry', :last_name => 'Cadena', :occupation => 'Mental Health Program Manager'},
  {:first_name => 'Jimmy', :last_name => 'Torrence', :occupation => 'School Bus Dispatcher'},
  {:first_name => 'Vanessa', :last_name => 'Kershner', :occupation => 'Immigration Investigator'},
  {:first_name => 'Daniel', :last_name => 'Sisson', :occupation => 'Blood Donor Recruiter'},
]

BOARDMEMBERS = [
  {:first_name => 'Gerald', :last_name => 'Lemaster', :occupation => 'Clerk Typist'},
  {:first_name => 'Bruce', :last_name => 'Desai', :occupation => 'Loan Teller'},
]

ADVISORS = [
  {:first_name => 'Melanie', :last_name => 'Kindred', :occupation => 'Radiation Engineer'},
  {:first_name => 'Nathan', :last_name => 'Cortes', :occupation => 'Wildlife Veterinarian'}
]

PHONE_LABELS = ['Mobile','Home','Business']
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

Person.find(:all).each do |p|
  p.phone_numbers.create(:label => PHONE_LABELS[rand(3)], :info => PHONE_NUMBER_GENERATOR.rand(1000000000..9999999999))
end
