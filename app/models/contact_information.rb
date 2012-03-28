class ContactInformation < ActiveRecord::Base
  belongs_to :contactable, :polymorphic => true
end

class PhoneNumber < ContactInformation
end

class PhysicalAddress < ContactInformation
end

class EmailAddress < ContactInformation
end
