class Note < ActiveRecord::Base
  belongs_to :notable, :polymorphic => true
  validates :subject, :presence => true

  def head
    subject
  end

end
