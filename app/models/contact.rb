module Contact
  def update_with(attributes)
    # Type is separately updated because, as a single table inheritance specific
    # property, it cannot be mass assigned with update_attributes.
    if self.type != attributes[:type]
      self.type = attributes[:type]
      if !self.new_record?
        self.save
      end
      # The object needs to be reloaded after changing type for the SQL statement
      # to work properly and not call on the old class.
      updated_contact = self.becomes(self.type.constantize)
    else
      updated_contact = self
    end
    updated_contact.update_attributes(attributes.except(:type))
    if updated_contact.invalid?
      updated_contact.errors.each do |attr, msg|
        self.errors.add(attr, msg)
      end
      false
    else
      true
    end
  end
end
