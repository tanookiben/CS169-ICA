class Person < ActiveRecord::Base
  has_one :phone_number, :as => :callable
  
  validates :first_name,  :presence   => true
  validates :last_name,   :presence   => true

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_with(updated_attributes)
    update_attributes!(updated_attributes.except(:type, :phone_number))
# Type is separately updated because, as a single table inheritance specific
# property, it cannot be mass assigned with update_attributes.
    update_attribute(:type, updated_attributes[:type])
# Phone numbers cannot be assigned through Person's update_attributes.
    phone_number.update_attributes!(updated_attributes[:phone_number])
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
