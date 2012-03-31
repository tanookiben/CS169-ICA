class AddMoreContactsToDatabase < ActiveRecord::Migration
  MORE_CONTACTS = [
    {:first_name => 'Mike', :last_name => 'Vermillion', :occupation => 'Harvest Manager'},
    {:first_name => 'Gregory', :last_name => 'Topping', :occupation => 'Fire Sprinkler Installer'},
    {:first_name => 'Tammy', :last_name => 'Ellinger', :occupation => 'Fish and Wildlife Warden'},
    {:first_name => 'William', :last_name => 'Sandler', :occupation => 'Oxygen Therapy Technician'},
    {:first_name => 'Steve', :last_name => 'Cook', :occupation => 'Bar Back'},
    {:first_name => 'Isabel', :last_name => 'Crabb', :occupation => 'Applied Psychology Professor'},
    {:first_name => 'Beth', :last_name => 'Chisholm', :occupation => 'Body and Frame Technician'},
    {:first_name => 'Ann', :last_name => 'Bell', :occupation => 'Piano Tuner'},
    {:first_name => 'Jimmy', :last_name => 'Ferraro', :occupation => 'Office Clerk'},
    {:first_name => 'Erica', :last_name => 'Lovell', :occupation => 'Public Relations Officer'},
    {:first_name => 'Norman', :last_name => 'Emery', :occupation => 'Locomotive Inspector'},
    {:first_name => 'Margaret', :last_name => 'Darby', :occupation => 'Karate Instructor'},
    {:first_name => 'Barbara', :last_name => 'Theisen', :occupation => 'Flight Communications Operator'},
    {:first_name => 'Louis', :last_name => 'Bates', :occupation => 'Photojournalist'},
    {:first_name => 'Julia', :last_name => 'Herman', :occupation => 'Oceanographer'},
    {:first_name => 'Larry', :last_name => 'Cadena', :occupation => 'Mental Health Program Manager'},
    {:first_name => 'Jimmy', :last_name => 'Torrence', :occupation => 'School Bus Dispatcher'},
    {:first_name => 'Vanessa', :last_name => 'Kershner', :occupation => 'Immigration Investigator'},
    {:first_name => 'Daniel', :last_name => 'Sisson', :occupation => 'Blood Donor Recruiter'},
    {:first_name => 'Gerald', :last_name => 'Lemaster', :occupation => 'Clerk Typist'},
    {:first_name => 'Bruce', :last_name => 'Desai', :occupation => 'Loan Teller'},
    {:first_name => 'Melanie', :last_name => 'Kindred', :occupation => 'Radiation Engineer'},
    {:first_name => 'Nathan', :last_name => 'Cortes', :occupation => 'Wildlife Veterinarian'}
  ]

  def up
    MORE_CONTACTS.each do |contact|
      Person.create!(contact)
    end
  end

  def down
    MORE_CONTACTS.each do |contact|
      Person.find_by_first_name(contact[:first_name]).destroy
    end
  end
end
