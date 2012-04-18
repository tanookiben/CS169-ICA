require 'spec_helper'

describe Company do
  before(:each) do
    @count = Company.count
    @ultimate = { :first_name => "Super", :last_name => "Baller", :occupation => "Badass", :type => "Individual" }
    @ultimateCEO = Person.new(@ultimate)
    @apple = Company.create!({ :name => "TestApple", :representative => @ultimateCEO, :representative_role => "Ultimate Master" })
    @msoft = Company.create!({ :name => "TestMicrosoft", :representative => @ultimateCEO, :representative_role => "Greatest Leader" })
    @fbook = Company.create!({ :name => "TestFacebook", :representative => @ultimateCEO, :representative_role => "King" })
  end
  
  it "should successfully create companies" do
    Company.count.should == 3+@count
  end
  
  describe "search" do
    it "should return successful matches for a suitable query" do
      @results = Company.search("Test")
      @results.should == [@apple,@msoft,@fbook]
    end
    
    it "should not return any matches for an unsuitable query" do
      @results = Company.search("Fail")
      @results.should == []
    end
  end
end
