class ContactPhone < ActiveRecord::Base
  belongs_to :contact
  belongs_to :phone_type
end
