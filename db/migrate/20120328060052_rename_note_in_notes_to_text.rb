class RenameNoteInNotesToText < ActiveRecord::Migration
  def up
    change_table :notes do |n|
      n.rename :note, :text
    end
  end

  def down
    change_table :notes do |n|
      n.rename :text, :note
    end
  end
end
