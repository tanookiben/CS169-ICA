class ContactsController < ApplicationController
  def search
    @search_term = params[:search]
    @individuals = @search_term ? Individual.search(@search_term) : Individual.all
    @individuals = @individuals.paginate(page: params[:individuals_page], per_page: 10)
    @board_members = @search_term ? BoardMember.search(@search_term) : BoardMember.all
    @board_members = @board_members.paginate(page: params[:board_members_page], per_page: 10)
    @advisors = @search_term ? Advisor.search(@search_term) : Advisor.all
    @advisors = @advisors.paginate(page: params[:advisors_page], per_page: 10)
    @education_companies = @search_term ? EducationCompany.search(@search_term) : EducationCompany.all
    @education_companies = @education_companies.paginate(page: params[:education_companies_page], per_page: 10)
    @portfolio_companies = @search_term ? PortfolioCompany.search(@search_term) : PortfolioCompany.all
    @portfolio_companies = @portfolio_companies.paginate(page: params[:portfolio_companies_page], per_page: 10)
    @professional_service_providers = @search_term ? ProfessionalServiceProvider.search(@search_term) : ProfessionalServiceProvider.all
    @professional_service_providers = @professional_service_providers.paginate(page: params[:professaionl_service_providers_page], per_page: 10)
  end
end
