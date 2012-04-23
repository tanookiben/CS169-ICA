class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.references :emailable, :polymorphic => true
      t.string :label
      t.string :info

      t.timestamps
    end
    add_index :email_addresses, :emailable_id
  end
end
