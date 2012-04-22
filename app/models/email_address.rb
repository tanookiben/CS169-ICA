class EmailAddress < ActiveRecord::Base
  belongs_to :emailable, :polymorphic => true
  validates :label, :inclusion => { :in => %w(Home Business Mobile Other) }
end
