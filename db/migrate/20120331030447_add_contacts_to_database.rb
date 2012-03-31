class AddContactsToDatabase < ActiveRecord::Migration
  CONTACTS = [
    {:first_name => 'Alan', :last_name => 'Arch', :occupation => 'Animal'},
    {:first_name => 'Bob', :last_name => 'Bertle', :occupation => 'Beekeeper'},
    {:first_name => 'Connor', :last_name => 'Corry', :occupation => 'Collector'}
  ]
  def up
    CONTACTS.each do |contact|
      Person.create!(contact)
    end
  end

  def down
    CONTACTS.each do |contact|
      Person.find_by_first_name(contact[:first_name]).destroy
    end
  end
end
