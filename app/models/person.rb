class Person < ActiveRecord::Base
  has_one :phone_number, :as => :callable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def update(updated_attributes)
    update_attributes!(updated_attributes.except(:type).except(:phone_numbers))
    update_attribute(:type, updated_attributes[:type])
#    phone_numbers.
  end

  def self.search(search_term)
    if search_term
      where('first_name LIKE ? OR last_name LIKE ?', "%#{search_term}%", "%#{search_term}%")
    end
  end
end
