require 'spec_helper'

describe CompaniesController do  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @company = { :name => "", :representative => Person.new, :representative_role => "", :type => "EducationCompany" }
      end
      
      it "should not create a company" do
        lambda do
          post :create, :company => @company
        end.should_not change(Company, :count).by(1)
      end
      
      it "should redirect to the company create page" do
        post :create, :company => @company
        response.should redirect_to(new_company_path)
      end
    end
    
    describe "success" do
      before(:each) do
        @company = {  :name => "Test Company",
                      :representative => Person.new({ :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob", :type => "Individual" }),
                      :representative_role => "Test Role",
                      :type =>  "EducationCompany" }
      end
      
      it "should create a company" do
        lambda do
          post :create, :company => @company
        end.should change(Company, :count).by(1)
      end
      
      it "should redirect to the new company page" do
        post :create, :company => @company
        response.should redirect_to(company_path(assigns(:company)))
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
      @company = FactoryGirl.create(:educ)
    end
    
    it "should be successful" do
      get 'edit', :id => @company
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @company = FactoryGirl.create(:educ)
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
    before(:each) do
      @benscompany = {  :name => "benscompany",
                        :representative => Person.new({ :first_name => "Ben", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }),
                        :representative_role => "Owner",
                        :type => "ProfessionalServiceProvider" }
      @company = Company.new
      @company.update_with(@benscompany)
    end
    
    describe "failure" do
      before(:each) do
        @newben = { :name => "", :representative => Person.new, :representative_role => "", :type => "EducationCompany" }
      end
      
      it "should not change the company's attributes" do
        put :update, :id => @company, :professional_service_provider => @newben
        @newcompany = EducationCompany.find(:all, :conditions => [ "name is ? AND
                                                                    representative_role is ? AND
                                                                    type is ?", @newben[:name],
                                                                                @newben[:representative_role],
                                                                                @newben[:type]]).first
        @newcompany.should be_nil
      end
      
      it "should redirect to the company page" do
        put :update, :id => @company, :professional_service_provider => @newben
        response.should redirect_to(company_path(@company))
      end
    end
    
    describe "success" do
      before(:each) do
        @newben = { :name => "newbenscompany",
                    :representative => Person.new({ :first_name => "NewBen", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }),
                    :representative_role => "NewOwner",
                    :type => "PortfolioCompany" }
      end
      
      it "should change the company's attributes" do
        put :update, :id => @company, :professional_service_provider => @newben
        @newcompany = PortfolioCompany.find(:all, :conditions => ["name is ? AND
                                                                    representative_role is ? AND
                                                                    type is ?", @newben[:name],
                                                                                @newben[:representative_role],
                                                                                @newben[:type]]).first
        @newcompany.name.should == @newben[:name]
        @newcompany.representative_role.should == @newben[:representative_role]
        @newcompany.type.should == @newben[:type]
      end
      
      it "should redirect to the company page" do
        put :update, :id => @company, :professional_service_provider => @newben
        response.should redirect_to(company_path(@company))
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    before(:each) do
      @company = FactoryGirl.create(:educ)
    end
    
    it "should destroy the company" do
      lambda do
        delete :destroy, :id => @company
      end.should change(Company, :count).by(-1)
    end
    
    it "should redirect to the root page" do
      delete :destroy, :id => @company
      response.should redirect_to(root_path)
    end
  end
end
