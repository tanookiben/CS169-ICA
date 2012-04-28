# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FIRST_NAME = %w(Mike Gregory Tammy William Steve Gerald Bruce Melanie Nathan)
LAST_NAME = %w(Vermillion Topping Ellinger Sandler Cook Lemaster Desai Kindred Cortes)
OCCUPATION = %w(Harvest\ Manager Fire\ Sprinkler\ Installer Fish\ and\ Wildlife\ Warden Oxygen\ Therapy\ Technician Bar\ Back Clerk\ Typist Loan\ Teller Radiation\ Engineer Wildlife\ Veternarian)

(0..14).each do
  Individual.create(:first_name => FIRST_NAME.sample, :last_name => LAST_NAME.sample, :occupation => OCCUPATION.sample)
end

(0..1).each do
  BoardMember.create(:first_name => FIRST_NAME.sample, :last_name => LAST_NAME.sample, :occupation => OCCUPATION.sample)
  Advisor.create(:first_name => FIRST_NAME.sample, :last_name => LAST_NAME.sample, :occupation => OCCUPATION.sample)
end

NAME = %w(Translation\ Renderers Helpful\ Sows Key\ Community\ Inc. Total\ Information Network\ Community  Indicative\ Data)
ROLE = %w(Secretary Warden Manager Supervisor Hiring\ Manager Technician)

(0..1).each do
  EducationCompany.create(:name => NAME.sample, :representative => Individual.find(1+rand(15)), :representative_role => ROLE.sample)
  PortfolioCompany.create(:name => NAME.sample, :representative => Individual.find(1+rand(15)), :representative_role => ROLE.sample)
  ProfessionalServiceProvider.create(:name => NAME.sample, :representative => Individual.find(1+rand(15)), :representative_role => ROLE.sample)
end

LABELS = %w(Mobile Business Other Home)
PHONE_NUMBER_GENERATOR = Random.new

#Person.all.each do |p|
#  p.create_phone_number(:label => LABELS[rand(4)], :info => PHONE_NUMBER_GENERATOR.rand(1000000000..9999999999))
#  p.create_email_address(:label => LABELS[rand(4)], :info => "foo")
#end

#Company.all.each do |c|
#  c.create_phone_number(:label => LABELS[rand(3)], :info => PHONE_NUMBER_GENERATOR.rand(1000000000..9999999999))
#  c.create_email_address(:label => LABELS[rand(3)], :info => "bar")
#end
