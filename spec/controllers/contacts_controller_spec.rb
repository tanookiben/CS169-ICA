require 'spec_helper'

describe ContactsController do
  describe 'index' do
    it "should be successful" do
      get :index
      response.should be_successful
    end
  end
  
  describe 'search' do
    before(:each) do
      @ind1 = FactoryGirl.create(:individual)
      @ind2 = FactoryGirl.create(:individual)
      @adv1 = FactoryGirl.create(:advisor)
      @adv2 = FactoryGirl.create(:advisor)
      @brd1 = FactoryGirl.create(:boardmember)
      @brd2 = FactoryGirl.create(:boardmember)
      @edu1 = FactoryGirl.create(:educ)
      @edu2 = FactoryGirl.create(:educ)
      @prt1 = FactoryGirl.create(:prtf)
      @prt2 = FactoryGirl.create(:prtf)
      @prf1 = FactoryGirl.create(:prof)
      @prf2 = FactoryGirl.create(:prof)
    end

    it "should return successful matches for a suitable query" do
      get :search, :search => "My"
      assigns(:individuals).should == [@ind1,@ind2]
      assigns(:board_members).should == [@brd1,@brd2]
      assigns(:advisors).should == [@adv1,@adv2]
      assigns(:education_companies).should == [@edu1,@edu2]
      assigns(:portfolio_companies).should == [@prt1,@prt2]
      assigns(:professional_service_providers).should == [@prf1,@prf2]
    end

    it "should not return any matches for an unsuitable query" do
      get :search, :search => "Fail"
      assigns(:individuals).should == []
      assigns(:board_members).should == []
      assigns(:advisors).should == []
      assigns(:education_companies).should == []
      assigns(:portfolio_companies).should == []
      assigns(:professional_service_providers).should == []
    end
  end
end
