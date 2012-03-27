class CreateContactEmails < ActiveRecord::Migration
  def change
    create_table :contact_emails do |t|
      t.integer :contact_id
      t.string :email_address

      t.timestamps
    end
  end
end
