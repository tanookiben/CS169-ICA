require 'spec_helper'

describe PeopleController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @person = { :first_name => "", :last_name => "", :occupation => "", :type => "Individual" }
      end
      it "should not create a person" do
        lambda do
          post :create, :person => @person
        end.should_not change(Person, :count)
      end
      
      it "should redirect to the person create page" do
        post :create, :person => @person
        response.should redirect_to(new_person_path)
      end
    end
    
    describe "success" do
      before(:each) do
        @person = { :first_name => "Ben", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }
      end
      
      it "should create a person" do
        lambda do
          post :create, :person => @person
        end.should change(Person, :count).by(1)
      end
      
      it "should redirect to the new person page" do
        post :create, :person => @person
        response.should redirect_to(person_path(assigns(:person)))
      end
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @person =  FactoryGirl.create(:individual)
    end
    
    it "should be successful" do
      get 'edit', :id => @person
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @person =  FactoryGirl.create(:individual)
    end
    
    it "should be successful" do
      get 'show', :id => @person
      response.should be_successful
    end
    
    it "should find the right person" do
      get 'show', :id => @person
      assigns(:person).should == @person
    end
  end
  
  describe "PUT 'update'" do
    before(:each) do
      @ben =  { :first_name => "Ben", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }
      @person = Person.new
      @person.update_with(@ben)
    end
    
    describe "failure" do
      before(:each) do
        @newben = { :first_name => "", :last_name => "", :occupation => "", :type => "Advisor" }
      end
      
      it "should not change the person's attributes" do
        put :update, :id => @person, :individual => @newben
        @newperson = Advisor.find(:all, :conditions => ["first_name is ? AND
                                                          last_name is ? AND
                                                          occupation is ? AND
                                                          type is ?", @newben[:first_name],
                                                                      @newben[:last_name],
                                                                      @newben[:occupation],
                                                                      @newben[:type]]).first
        @newperson.should be_nil
      end
      
      it "should redirect to the person's page" do
        put :update, :id => @person, :individual => @newben
        response.should redirect_to(person_path(@person))
      end
    end
      
    describe "success" do
      before(:each) do
        @newben = { :first_name => "New First Name", :last_name => "New Last Name", :occupation => "New Job", :type => "Advisor" }
      end
        
      it "should change the person's attributes" do
        put :update, :id => @person, :individual => @newben
        @newperson = Advisor.find(:all, :conditions => ["first_name is ? AND
                                                          last_name is ? AND
                                                          occupation is ? AND
                                                          type is ?", @newben[:first_name],
                                                                      @newben[:last_name],
                                                                      @newben[:occupation],
                                                                      @newben[:type]]).first
        @newperson.first_name.should == @newben[:first_name]
        @newperson.last_name.should == @newben[:last_name]
        @newperson.occupation.should == @newben[:occupation]
        @newperson.type.should == @newben[:type]
      end
        
      it "should redirect to the person's page" do
        put :update, :id => @person, :individual => @newben
        response.should redirect_to(person_path(@person))
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    before(:each) do
      @person = FactoryGirl.create(:individual)
    end
    
    it "should destroy the person" do
      lambda do
        delete :destroy, :id => @person
      end.should change(Person, :count).by(-1)
    end
    
    it "should redirect to the root page" do
      delete :destroy, :id => @person
      response.should redirect_to(root_path)
    end
  end

end