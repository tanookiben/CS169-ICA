class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :contact_id
      t.date :date
      t.integer :number

      t.timestamps
    end
  end
end
