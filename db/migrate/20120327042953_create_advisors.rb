class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :advisors do |t|
      t.integer :contact_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
