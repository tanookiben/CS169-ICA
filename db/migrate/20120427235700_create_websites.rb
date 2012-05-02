class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.references :linkable, :polymorphic => true
      t.string :domain
      t.string :url

      t.timestamps
    end
    add_index :websites, :linkable_id
  end
end
