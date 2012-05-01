require 'spec_helper'

describe Company do
  before(:each) do
    @count = Company.count
    @ultimate = { :first_name => "Super", :last_name => "Baller", :occupation => "Badass", :type => "Individual" }
    @ultimateCEO = Person.new(@ultimate)
    @appleattr = { :name => "TestApple",
                                :representative => @ultimateCEO,
                                :representative_role => "Ultimate Master",
                                :type => "ProfessionalServiceProvider" }
    @msoftattr = { :name => "TestMicrosoft",
                                :representative => @ultimateCEO,
                                :representative_role => "Greatest Leader",
                                :type => "ProfessionalServiceProvider" }
    @fbookattr = { :name => "TestFacebook",
                                :representative => @ultimateCEO,
                                :representative_role => "King",
                                :type => "ProfessionalServiceProvider" }
    @apple = ProfessionalServiceProvider.new
    @msoft = ProfessionalServiceProvider.new
    @fbook = ProfessionalServiceProvider.new
    @apple.update_with(@appleattr)
    @msoft.update_with(@msoftattr)
    @fbook.update_with(@fbookattr)
  end
  
  it "should successfully create companies" do
    Company.count.should == 3+@count
  end
  
  describe "representative name" do
    it "should successfully return the representative's name" do
      @repname = @apple.representative_name
      @repname.should == "Super Baller"
    end
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
