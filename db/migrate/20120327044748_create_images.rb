class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :contact_id
      t.string :file_path
      t.boolean :active

      t.timestamps
    end
  end
end
