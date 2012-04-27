class ContactsController < ApplicationController

  def index
    @individuals = Individual.all.paginate(page: params[:individuals_page], per_page: 10)
    @board_members = BoardMember.all.paginate(page: params[:board_members_page], per_page: 10)
    @advisors = Advisor.all.paginate(page: params[:advisors_page], per_page: 10)
    @education_companies = EducationCompany.all.paginate(page: params[:education_companies_page], per_page: 10)
    @portfolio_companies = PortfolioCompany.all.paginate(page: params[:portfolio_companies_page], per_page: 10)
    @professional_service_providers = ProfessionalServiceProvider.all.paginate(page: params[:professaionl_service_providers_page], per_page: 10)
  end

  def search
    @search_term = params[:search]
    @individuals = Individual.search(@search_term).paginate(page: params[:individuals_page], per_page: 10)
    @board_members = BoardMember.search(@search_term).paginate(page: params[:board_members_page], per_page: 10)
    @advisors = Advisor.search(@search_term).paginate(page: params[:advisors_page], per_page: 10)
    @education_companies = EducationCompany.search(@search_term).paginate(page: params[:education_companies_page], per_page: 10)
    @portfolio_companies = PortfolioCompany.search(@search_term).paginate(page: params[:portfolio_companies_page], per_page: 10)
    @professional_service_providers = ProfessionalServiceProvider.search(@search_term).paginate(page: params[:professaionl_service_providers_page], per_page: 10)
  end
end
