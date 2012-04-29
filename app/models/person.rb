class Person < ActiveRecord::Base
  has_many :phone_numbers, :as => :callable, :dependent => :destroy
  has_many :email_addresses, :as => :emailable, :dependent => :destroy
  has_many :websites, :as => :linkable, :dependent => :destroy
  has_many :notes, :as => :notable, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers, :allow_destroy => true
  accepts_nested_attributes_for :email_addresses, :allow_destroy => true
  accepts_nested_attributes_for :websites, :allow_destroy => true
  accepts_nested_attributes_for :notes, :allow_destroy => true

  has_many :companies, :foreign_key => "representative_id"

  validates :type, :inclusion => { :in => %w(Individual BoardMember Advisor) }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :occupation, :presence => true
  validates_associated :phone_numbers
  validates_associated :email_addresses
  validates_associated :websites
  validates_associated :notes

  # Mixes in the update_with method since it is shared between this and Company
  include Contact

  def full_name
    "#{first_name} #{last_name}"
  end
  alias :name :full_name

  def self.find_by_full_name(name)
    (Person.find_all_by_first_name(name.split(" ")[0]) & Person.find_all_by_last_name(name.split(" ")[1])).first
  end

  def self.find_all_by_full_name(name)
    Person.find_all_by_first_name(name.split(" ")[0]) & Person.find_all_by_last_name(name.split(" ")[1])
  end

  class << self
    alias :find_by_name :find_by_full_name
    alias :find_all_by_name :find_all_by_full_name
  end

  def self.search(search_term)
    if search_term.match(" ")
      where('first_name LIKE ? AND last_name LIKE ?', "%#{search_term}%".split(" ")[0], "%#{search_term}%".split(" ")[1])
    elsif search_term
      where('first_name LIKE ? OR last_name LIKE ?', "%#{search_term}%", "%#{search_term}%")
    end
  end

end
