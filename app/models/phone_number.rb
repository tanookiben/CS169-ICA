class PhoneNumber < ActiveRecord::Base
  belongs_to :callable, :polymorphic => true
  validates :label, :inclusion => { :in => %w(Business Home Mobile Fax Other) }

  def head
    label
  end

  def body
    number
  end
end
