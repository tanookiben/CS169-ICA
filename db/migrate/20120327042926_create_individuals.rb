class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.integer :contact_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
