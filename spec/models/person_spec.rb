require 'spec_helper'

describe Person do
  before(:each) do
    @ben_attr = { :first_name => "TestBen", :last_name => "Hsieh", :occupation => "Developer" }
    @kon_attr = { :first_name => "TestKon", :last_name => "Rud", :occupation => "Developer" }
    @ter_attr = { :first_name => "TestTer", :last_name => "Yeh", :occupation => "Developer" }
    @tom_attr = { :first_name => "TestTom", :last_name => "Liao", :occupation => "Developer" }
    @ben = Person.create!(@ben_attr)
    @kon = Person.create!(@kon_attr)
    @ter = Person.create!(@ter_attr)
    @tom = Person.create!(@tom_attr)
  end
  
  it "should successfully create people" do
    Person.count.should == 4
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
      @results = Person.find_by_full_name("TestBen Hsieh")
      @results.should == [@ben]
    end
    
    it "should not return any matches for an unsuitable name query" do
      @results = Person.find_by_full_name("Ben Hsieh")
      @results.should == []
    end
  end
end
