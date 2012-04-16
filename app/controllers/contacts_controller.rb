class ContactsController < ApplicationController
  def search
    @search_term = params[:search]
    @individuals = @search_term ? Individual.search(@search_term) : Individual.all
    @board_members = @search_term ? BoardMember.search(@search_term) : BoardMember.all
    @advisors = @search_term ? Advisor.search(@search_term) : Advisor.all
    @education_companies = @search_term ? EducationCompany.search(@search_term) : EducationCompany.all
    @portfolio_companies = @search_term ? PortfolioCompany.search(@search_term) : PortfolioCompany.all
    @professional_service_providers = @search_term ? ProfessionalServiceProvider.search(@search_term) : ProfessionalServiceProvider.all
  end
end
