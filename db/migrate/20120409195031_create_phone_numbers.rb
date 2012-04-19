class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.references :callable, :polymorphic => true
      t.string :label
      t.integer :number, :limit => 8

      t.timestamps
    end
    add_index :phone_numbers, :callable_id
  end
end
