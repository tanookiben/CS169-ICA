require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new
    @person.id = 1
  end

  it 'should let me add a phone number to a person' do
    phone_number = @person.phone_numbers.build(:label => 'Mobile', :info => '9098378844')
    phone_number.info.should == '9098378844'
  end
end

describe Individual do
  before :each do
    @individual = Individual.new
    @individual.id = 1
  end

  it 'should let me add a phone number to an individual' do
    @individual.should == 'foo'
    phone_number = @individual.phone_numbers.build(:label => 'Mobile', :info => '9098378844')
    phone_number.info.should == '9098378844'
  end
end
