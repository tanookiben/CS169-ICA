class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :notable, :polymorphic => true
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
