class CreateProfessionalServiceProviders < ActiveRecord::Migration
  def change
    create_table :professional_service_providers do |t|
      t.integer :contact_id
      t.string :name
      t.integer :representative_id
      t.string :representative_role

      t.timestamps
    end
  end
end
