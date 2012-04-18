require 'spec_helper'

describe CompaniesController do  
  describe "POST 'create'" do
    describe "failure" do
    end
    
    describe "success" do
      before(:each) do
        @company = { :name => "Test Company", :representative => Person.new({ :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob", :type => "Individual" }), :representative_role => "Test Role" }
      end
      
      it "should create a company" do
        # lambda do
        #   post :create, :company => @company
        # end.should change(Company, :count).by(1)
      end
      
      it "should redirect to the new company page" do
        # post :create, :company => @company
        # response.should redirect_to(company_path(assigns(:company)))
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
      @company = FactoryGirl.create(:company)
    end
    
    it "should be successful" do
      get 'edit', :id => @company
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @companyattr = { :name => "Test Company", :representative => Person.new({ :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob", :type => "Individual" }), :representative_role => "Test Role" }
      @company = Company.create!(@companyattr)
    end
    
    it "should be successful" do
      get 'show', :id => @company
      response.should be_successful
    end
    
    it "should show the correct company" do
      get 'show', :id => @company
      assigns(:company).should == @company
    end
  end
  
  describe "PUT 'update'" do
    describe "failure" do
    end
    
    describe "success" do
      it "should change the company's attributes" do
      end
      
      it "should redirec to the company page" do
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should destroy the company" do
    end
    
    it "should redirect to the companies page" do
    end
  end
end
