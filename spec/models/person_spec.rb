require 'spec_helper'

describe Person do
  before(:each) do
    @ben_attr = { :first_name => "TestBen", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }
    @kon_attr = { :first_name => "TestKon", :last_name => "Rud", :occupation => "Developer", :type => "Individual" }
    @ter_attr = { :first_name => "TestTer", :last_name => "Yeh", :occupation => "Developer", :type => "BoardMember" }
    @tom_attr = { :first_name => "TestTom", :last_name => "Liao", :occupation => "Developer", :type => "Advisor" }
    @ben = Individual.new
    @ben.update_with(@ben_attr)
    @kon = Individual.new
    @kon.update_with(@kon_attr)
    @ter = BoardMember.new
    @ter.update_with(@ter_attr)
    @tom = Advisor.new
    @tom.update_with(@tom_attr)
  end
  
  it "should successfully create people" do
    Person.count.should == 4
  end
  
  it "should correctly create full name attribute" do
    @ben.full_name.should == "TestBen Hsieh"
    @kon.full_name.should == "TestKon Rud"
    @ter.full_name.should == "TestTer Yeh"
    @tom.full_name.should == "TestTom Liao"
  end
  
  describe "search terms" do
    it "should return successful matches for a suitable query" do
      @results = Person.search("Test")
      @results.should == [@ben,@kon,@ter,@tom]
    end
    
    it "should not return any matches for an unsuitable query" do
      @results = Person.search("Fail")
      @results.should == []
    end
  end
  
  describe "search names" do
    it "should return successful matches for a suitable name query" do
      @results = Person.search("TestBen Hsieh")
      @results.should == [@ben]
    end
    
    it "should not return any matches for an unsuitable name query" do
      @results = Person.search("DoesNotExist")
      @results.should == []
    end
  end
end
