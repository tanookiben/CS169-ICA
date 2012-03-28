class Person < ActiveRecord::Base
  has_many :phone_numbers, :as => :contactable, :class_name => 'PhoneNumber'
  has_many :physical_addresses, :as => :contactable, :class_name => 'PhysicalAddress'
  has_many :email_addresses, :as => :contactable, :class_name => 'EmailAddress'
end

class Individual < Person
end

class BoardMember < Person
end
