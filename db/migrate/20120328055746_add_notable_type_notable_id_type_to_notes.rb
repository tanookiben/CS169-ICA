class AddNotableTypeNotableIdTypeToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :notable_type, :string
    add_column :notes, :notable_id, :integer
    add_column :notes, :type, :string
  end
end
