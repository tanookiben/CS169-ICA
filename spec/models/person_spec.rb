require 'spec_helper'

describe Person do

  describe 'Validation' do
    before :each do
      @person = FactoryGirl.create(:person)
    end

    it 'is valid with proper values' do
      @person.should be_valid
    end

    it 'is not valid without a first_name' do
      @person.first_name = nil
      @person.should_not be_valid
    end

    it 'is not valid without a last_name' do
      @person.last_name = nil
      @person.should_not be_valid
    end

    it 'is not valid without an occupation' do
      @person.occupation = nil
      @person.should_not be_valid
    end
  end


  describe 'Add Contact Information' do
    before :each do
      @individual = FactoryGirl.create(:individual)
      @board_member = FactoryGirl.create(:board_member)
      @advisor = FactoryGirl.create(:advisor)
    end

    describe 'Adding a phone number to a person' do
      before :each do
        @phone_number = @individual.add_phone_number('Mobile', '9098378844')
      end

      it 'should have matching contactable and person ids' do
        @phone_number.contactable_id.should eql @individual.id
      end

      it 'should have the correct phone_number' do
        @individual.phone_numbers.first.info.should eql '9098378844'
      end
    end

    describe 'Adding a physical address to a person' do
      before :each do
        @physical_address = @board_member.add_physical_address('Business', '1350 Fog Road')
      end

      it 'should have matching contactable and person ids' do
        @physical_address.contactable_id.should eql @board_member.id
      end

      it 'should have the correct address' do
        @board_member.physical_addresses.first.info.should eql '1350 Fog Road'
      end
    end

    describe 'Adding an email address to a person' do
      before :each do
        @email_address = @advisor.add_email_address('Work', 'jdoe@gmail.com')
      end

      it 'should have matching contactable and person ids' do
        @email_address.contactable_id.should eql @advisor.id
      end

      it 'should have the correct address' do
        @advisor.email_addresses.first.info.should eql 'jdoe@gmail.com'
      end
    end
  end


  describe 'Add Notes' do
    before :each do
      @individual = FactoryGirl.create(:individual)
      @note = @individual.add_note('Just a little note')
    end

    it 'should add a note to a person' do
      @note.notable_id.should eql @individual.id
    end
  end

end


describe Individual do
  pending 'Future Individual specific testing goes here'
end


describe BoardMember do
  pending 'Future BoardMember specific testing goes here'
end
