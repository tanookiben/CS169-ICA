require 'spec_helper'

describe CompaniesController do  
  describe "POST 'create'" do
    describe "failure case 1" do
      before(:each) do
        @company = { :name => "", :representative_role => "", :type => "EducationCompany" }
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
    
    describe "failure case 2" do
      before(:each) do
        @attr = { :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob", :type => "Individual" }
        @person = Person.new
        @person.update_with(@attr)        
        @company = { :name => "", :representative_name => "MyFirst MyLast", :representative_role => "", :type => "EducationCompany" }
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
        @attr = { :first_name => "MyFirst", :last_name => "MyLast", :occupation => "MyJob", :type => "Individual" }
        @person = Person.new
        @person.update_with(@attr)
        @company = {  :name => "Test Company",
                      :representative_role => "Test Role",
                      :type =>  "EducationCompany",
                      :representative_name => "MyFirst MyLast" }
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
      @attr = { :first_name => "Ben", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }
      @ben = Person.new
      @ben.update_with(@attr)
      @benscompany = {  :name => "benscompany",
                        :representative => @ben,
                        :representative_role => "Owner",
                        :type => "ProfessionalServiceProvider"}
      @company = Company.new
      @company.update_with(@benscompany)
    end

    describe "failure case 1" do
      before(:each) do
        @newben = { :name => "", :representative_role => "", :type => "EducationCompany" }
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
        response.should redirect_to(edit_company_path(@company))
      end
    end
    
    describe "failure case 2" do
      before(:each) do
        @attr = { :first_name => "NewBen", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }
        @person = Person.new
        @person.update_with(@attr)
        @newben = { :name => "", :representative_name => "NewBen Hsieh", :representative_role => "", :type => "EducationCompany" }
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
        response.should redirect_to(edit_company_path(@company))
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { :first_name => "NewBen", :last_name => "Hsieh", :occupation => "Developer", :type => "Individual" }
        @person = Person.new
        @person.update_with(@attr)
        @newben = { :name => "newbenscompany",
                    :representative_role => "NewOwner",
                    :type => "PortfolioCompany",
                    :representative_name => "NewBen Hsieh" }
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
