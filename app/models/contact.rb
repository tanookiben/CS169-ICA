class Contact < ActiveRecord::Base
  belongs_to :contact_type

  has_many :contact_addresses
  has_many :contact_emails
  has_many :contact_phones

  has_many :images
  has_many :notes

  has_many :advisors
  has_many :board_members
  has_many :individuals

  has_many :education_companies
  has_many :portfolio_companies
  has_many :professional_service_providers

  has_many :jobs
  has_many :revenues

  has_many :client_relationships, :foreign_key => 'company_id'
                                , :class_name => 'WorkingRelationship'
                                , :dependent => :destroy
  has_many :clients, :through => :client_relationships
  has_many :company_relationships, :foreign_key => 'client_id'
                                 , :class_name => 'WorkingRelationship'
                                 , :dependent => :destroy
  has_many :companies, :through => :company_relationships
end
