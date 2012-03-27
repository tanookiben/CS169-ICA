class CreateWorkingRelationships < ActiveRecord::Migration
  def change
    create_table :working_relationships do |t|
      t.integer :company_id
      t.integer :client_id

      t.timestamps
    end
  end
end
