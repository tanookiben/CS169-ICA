class PhoneNumber < ActiveRecord::Base
  belongs_to :callable, :polymorphic => true
  validates :label, :inclusion => { :in => %w(Home Business Mobile Other) }

  def head
    label
  end

  def body
    number
  end
end
