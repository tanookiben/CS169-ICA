class Person < ActiveRecord::Base
  has_many :phone_numbers, :as => :contactable, :class_name => 'PhoneNumber'
  has_many :physical_addresses, :as => :contactable, :class_name => 'PhysicalAddress'
  has_many :email_addresses, :as => :contactable, :class_name => 'EmailAddress'

  has_many :notes, :as => :notable, :class_name => 'Note'

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :occupation

  def add_phone_number(label, number)
    self.phone_numbers.create(:label => label, :info => number)
  end

  def add_physical_address(label, address)
    self.physical_addresses.create(:label => label, :info => address)
  end

  def add_email_address(label, email)
    self.email_addresses.create(:label => label, :info => email)
  end

  def add_note(text)
    self.notes.create(:text => text)
  end

  def self.search(search)
    if search
      where('first_name LIKE ?', "%#{search}%")
    else
      nil
    end
  end
end

class Individual < Person
end

class BoardMember < Person
end

class Advisor < Person
end
