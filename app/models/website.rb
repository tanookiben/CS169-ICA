class Website < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true
  validates :type, :inclusion => { :in => %w(Business Personal LinkedIn Other) }

  def head
    type
  end

  def body
    url
  end
end
