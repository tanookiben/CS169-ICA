class CreateContactPhones < ActiveRecord::Migration
  def change
    create_table :contact_phones do |t|
      t.integer :contact_id
      t.integer :phone_number
      t.integer :phone_type_id

      t.timestamps
    end
  end
end
