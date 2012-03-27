class ProfessionalServiceProvider < ActiveRecord::Base
  belongs_to :contact
  belongs_to :contact, :foreign_key => "representative_id"
end
