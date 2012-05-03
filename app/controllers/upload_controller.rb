class UploadController < ApplicationController

  def index
  end

  def upload
    require 'csv'
    # @ben.update_with({ :first_name => "ben", :last_name => "hsieh", :type => "Individual", :occupation => "job" })
    tmp = params[:file_upload][:importfile].tempfile
    CSV.foreach(tmp.path, { :headers => true, :header_converters => :symbol }) do |row|
      fname = "#{row[:given_name]}"
      lname = "#{row[:family_name]}"
      email1type = "#{row[:email_1__type]}".gsub("* ","")
      if email1type == "Work"
        email1type = "Business"
      end
      email1value = "#{row[:email_1__value]}"
      email2type = "#{row[:email_2__type]}".gsub("* ","")
      if email2type == "Work"
        email2type = "Business"
      end
      email2value = "#{row[:email_2__value]}"
      phone1type = "#{row[:phone_1__type]}".gsub("* ","")
      phone1value = "#{row[:phone_1__value]}"
      phone2type = "#{row[:phone_2__type]}".gsub("* ","")
      phone2value = "#{row[:phone_2__value]}"
      data = {}
      data[:first_name] = fname
      data[:last_name] = lname
      data[:email1type] = email1type
      data[:email1value] = email1value
      data[:email2type] = email2type
      data[:email2value] = email2value
      data[:phone1type] = phone1type
      data[:phone1value] = phone1value
      data[:phone2type] = phone2type
      data[:phone2value] = phone2value
      data.delete_if do |k,v|
        v == ""
      end
      data.each do |k,v|
        puts "#{k}: #{v}"
      end
      # puts data.size
      if email1type != ""
        if email2type != ""
          if phone1type != ""
            if phone2type != ""
              # email1, email2, phone1, phone2
              params = { :person => {
                :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD",
                :phone_numbers_attributes => [
                  { :label => phone1type, :number => phone1value },
                  { :label => phone2type, :number => phone2value }
                ],
                :email_addresses_attributes => [
                  { :label => email1type, :address => email1value },
                  { :label => email2type, :address => email2value }
                ]
              }}
            else
              # email1, email2, phone1
              params = { :person => {
                :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD",
                :phone_numbers_attributes => [
                  { :label => phone1type, :number => phone1value }
                ],
                :email_addresses_attributes => [
                  { :label => email1type, :address => email1value },
                  { :label => email2type, :address => email2value }
                ]
              }}
            end
          else
            # email1, email2
            params = { :person => {
              :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD",
              :email_addresses_attributes => [
                { :label => email1type, :address => email1value },
                { :label => email2type, :address => email2value }
              ]
            }}
          end
        else
          if phone1type != ""
            if phone2type != ""
              # email1, phone1, phone2
              params = { :person => {
                :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD",
                :phone_numbers_attributes => [
                  { :label => phone1type, :number => phone1value },
                  { :label => phone2type, :number => phone2value }
                ],
                :email_addresses_attributes => [
                  { :label => email1type, :address => email1value },
                ]
              }}
            else
              # email1, phone1
              params = { :person => {
                :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD",
                :phone_numbers_attributes => [
                  { :label => phone1type, :number => phone1value }
                ],
                :email_addresses_attributes => [
                  { :label => email1type, :address => email1value }
                ]
              }}
            end
          else
            # email1
            params = { :person => {
              :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD",
              :email_addresses_attributes => [
                { :label => email1type, :address => email1value }
              ]
            }}
          end
        end
      else
        # no email, no phone
        params = { :person => {
          :first_name => fname, :last_name => lname, :type => "Individual", :occupation => "TBD"
        }}
      end
      # puts params[:person]
      @newperson = Person.new()
      @newperson.update_with(params[:person])
    end

    redirect_to search_path
  end

end
