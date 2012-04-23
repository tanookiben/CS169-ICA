class Company < ActiveRecord::Base
  has_one :phone_number, :as => :callable, :dependent => :destroy
  accepts_nested_attributes_for :phone_number
  belongs_to :representative, :foreign_key => "representative_id", :class_name => "Person"

  validates :type, :inclusion => { :in => %w(EducationCompany PortfolioCompany ProfessionalServiceProvider) }
  validates :name, :presence => true
  validates :representative_role, :presence => true

  # Mixes in the update_with method since it is shared between this an Company
  include Contact

  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term}%")
    end
  end
end
