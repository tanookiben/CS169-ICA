class Company < ActiveRecord::Base
  has_one :phone_number, :as => :callable, :dependent => :destroy
  accepts_nested_attributes_for :phone_number
  belongs_to :representative, :foreign_key => "representative_id", :class_name => "Person"

  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term}%")
    end
  end

  def update_with(attributes)
    update_attributes(attributes.except(:type))
    # Type is separately updated because, as a single table inheritance specific
    # property, it cannot be mass assigned with update_attributes.
    update_attribute(:type, attributes[:type])
    save
  end
end
