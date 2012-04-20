class Company < ActiveRecord::Base
  has_many :phone_numbers, :as => :callable, :dependent => :destroy
#  has_many :email_addresses, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers
#  accepts_nested_attributes_for :email_address

  belongs_to :representative, :foreign_key => "representative_id", :class_name => "Person"

  validates :type, :inclusion => { :in => %w(EducationCompany PortfolioCompany ProfessionalServiceProvider) }
  validates :name, :presence => true
  validates_associated :phone_numbers

  # Mixes in the update_with method since it is shared between this an Company
  include Contact

  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term}%")
    end
  end
end
