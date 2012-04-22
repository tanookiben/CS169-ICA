class Person < ActiveRecord::Base
  has_one :phone_number, :as => :callable, :dependent => :destroy
  accepts_nested_attributes_for :phone_number

  has_one :company, :foreign_key => "representative_id"

  #validates :type, :inclusion => { :in => %w(Individual BoardMember Advisor) }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :occupation, :presence => true
  validates_associated :phone_number

  # Mixes in the update_with method since it is shared between this an Company
  include Contact

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search_term)
    if search_term
      where('first_name LIKE ? OR last_name LIKE ?', "%#{search_term}%", "%#{search_term}%")
    end
  end

  def self.find_by_full_name(full_name)
    where('first_name LIKE ? AND last_name LIKE ?', full_name.split(" ")[0], full_name.split(" ")[1])
  end
end
