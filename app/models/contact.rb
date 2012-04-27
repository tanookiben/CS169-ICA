module Contact
  def update_with(attributes)
    if self.type != attributes[:type]
      self.type = attributes[:type]
    end
      self.update_attributes(attributes.except(:type))
  end
end
