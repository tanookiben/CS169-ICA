class Company < ActiveRecord::Base
  has_one :phone_number, :as => :callable, :dependent => :destroy
  has_one :email_address, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :phone_number
  accepts_nested_attributes_for :email_address
  belongs_to :representative, :foreign_key => "representative_id", :class_name => "Person"

  # Mixes in the update_with method since it is shared between this and Person
  include Contact

  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term}%")
    end
  end
end
