class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.integer :contact_id
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end
