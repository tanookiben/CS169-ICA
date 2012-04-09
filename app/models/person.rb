class Person < ActiveRecord::Base
  has_many :phone_numbers, :as => :contactable, :class_name => 'PhoneNumber'
  has_many :physical_addresses, :as => :contactable, :class_name => 'PhysicalAddress'
  has_many :email_addresses, :as => :contactable, :class_name => 'EmailAddress'
  accepts_nested_attributes_for :phone_numbers, :allow_destroy => true
  accepts_nested_attributes_for :physical_addresses, :allow_destroy => true
  accepts_nested_attributes_for :email_addresses, :allow_destroy => true

  has_many :notes, :as => :notable, :class_name => 'Note'

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :occupation

  def full_name
    self.first_name + ' ' + self.last_name
  end

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
      where('first_name LIKE ? OR last_name LIKE ? OR occupation LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end
  
  def self.find_by_full_name(full_name)
    where('first_name LIKE ? AND last_name LIKE ?', full_name.split(" ")[0], full_name.split(" ")[1])
  end
end

