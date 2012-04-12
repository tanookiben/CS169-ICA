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
        @person = { :first_name => "", :last_name => "", :occupation => "" }
      end
      it "should not create a person" do
        lambda {
          post :create, :person => @person
        }.should_not change(Person, :count)
      end

      it "should redirect to the people page" do
        post :create, :person => @person
        response.should redirect_to(root_path)
      end
    end

    describe "success" do
      before(:each) do
        @person = { :first_name => "Ben", :last_name => "Hsieh", :occupation => "Developer" }
      end

      it "should create a person" do
        lambda do
          post :create, :person => @person
        end.should change(Person, :count).by(1)
      end

      it "should redirect to the people page" do
        post :create, :person => @person
        response.should redirect_to(root_path)
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
      @person =  FactoryGirl.create(:person)
    end

    it "should be successful" do
      get 'edit', :id => @person
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @person =  FactoryGirl.create(:person)
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
  
  # describe "PUT 'update'" do
  #     before(:each) do
  #       @person =  FactoryGirl.create(:person)
  #     end
  #     
  #     describe "success" do
  #       before(:each) do
  #         @new = { :first_name => "New First Name", :last_name => "New Last Name", :occupation => "New Job" }
  #       end
  #       
  #       it "should change the person's attributes" do
  #         put :update, :id => @person, :person => @new
  #         @person.reload
  #         @person.first_name.should == @new[:first_name]
  #         @person.last_name.should == @new[:last_name]
  #       end
  #       
  #       it "should redirect to the person's page" do
  #         put :update, :id => @person, :person => @new
  #         response.should redirect_to(person_path(@person))
  #       end
  #     end
  #   end

  describe "DELETE 'destroy'" do
    before(:each) do
      @person = FactoryGirl.create(:person)
    end

    it "should destroy the person" do
      lambda do
        delete :destroy, :id => @person
      end.should change(Person, :count).by(-1)
    end

    it "should redirect to the people page" do
      delete :destroy, :id => @person
      response.should redirect_to(root_path)
    end
  end

end
