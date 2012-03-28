require 'spec_helper'

describe Person do
  describe 'Validation' do
    before :each do
      @person = FactoryGirl.build(:person)
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

#  it 'should let me add a phone number to a person' do
#    phone_number = @person.phone_numbers.build(:label => 'Mobile', :info => '9098378844')
#    phone_number.info.should == '9098378844'
#  end
end

describe Individual do
  before :each do
    @individual = Individual.new
    @individual.id = 1
  end

  it 'should let me add a phone number to an individual' do
    phone_number = @individual.phone_numbers.build(:label => 'Mobile', :info => '9098378844')
    phone_number.info.should == '9098378844'
  end
end
