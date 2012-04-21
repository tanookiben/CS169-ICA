class Person < ActiveRecord::Base
  has_many :phone_numbers, :as => :callable, :dependent => :destroy
#  has_many :email_addresses, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers, :reject_if => lambda { |a| a[:info].blank? }, :allow_destroy => true
#  accepts_nested_attributes_for :email_address

  has_many :companies, :foreign_key => "representative_id"

  validates :type, :inclusion => { :in => %w(Individual BoardMember Advisor) }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :occupation, :presence => true
  validates_associated :phone_numbers

  # Mixes in the update_with method since it is shared between this and Company
  include Contact

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search_term)
    if search_term.match(" ")
      where('first_name LIKE ? AND last_name LIKE ?', "%#{search_term}%".split(" ")[0], "%#{search_term}%".split(" ")[1])
    elsif search_term
      where('first_name LIKE ? OR last_name LIKE ?', "%#{search_term}%", "%#{search_term}%")
    end
  end

end
