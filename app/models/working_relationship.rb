class WorkingRelationship < ActiveRecord::Base
  belongs_to :company, :class_name => 'Contact'
  belongs_to :client, :class_name => 'Contact'
end
