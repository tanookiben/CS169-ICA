class Person < ActiveRecord::Base
  has_many :phone_numbers, :as => :contactable, :class_name => 'PhoneNumber'
  has_many :physical_addresses, :as => :contactable, :class_name => 'PhysicalAddress'
  has_many :email_addresses, :as => :contactable, :class_name => 'EmailAddress'

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :occupation
end

class Individual < Person
end

class BoardMember < Person
end
