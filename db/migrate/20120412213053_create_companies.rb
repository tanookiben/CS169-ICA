class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :type
      t.string :name
      t.references :representative
      t.string :representative_role

      t.timestamps
    end
  end
end
