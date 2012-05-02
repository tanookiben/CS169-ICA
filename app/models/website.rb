class Website < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true
  validates :domain, :inclusion => { :in => %w(Business Personal LinkedIn Other) }

  def head
    domain
  end

  def body
    url
  end
end
