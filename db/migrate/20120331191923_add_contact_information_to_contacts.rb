class AddContactInformationToContacts < ActiveRecord::Migration 
  CONTACTS = Person.find(:all) 
  LABELS = ["Mobile","Home","Business"]
  NUMBER_GENERATOR = Random.new 

  def up 
    CONTACTS.each do |contact| 
      contact.phone_numbers.create(:label => LABELS[rand(3)], :info => NUMBER_GENERATOR.rand(1000000000..9999999999)) 
    end
  end

  def down
    CONTACTS.each do |contact|
      contact.phone_numbers.destroy
    end
  end
end
