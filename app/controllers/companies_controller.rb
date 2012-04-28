class CompaniesController < ApplicationController

  def create
    @company = Company.new
    if not params[:company][:representative_name].blank?
      if Person.find_by_name(params[:company][:representative_name])
        params[:company][:representative_id] = Person.find_by_name(params[:company][:representative_name])
      end
    else
      params[:company][:representative_id] = ""
    end
    params[:company].delete(:representative_name)
raise "#{params[:company][:representative_name]}\n\n#{params}"
    if @company.update_with(params[:company])
      flash[:notice] = "#{@company.name} was created."
      redirect_to company_path(@company)
    else 
      flash[:error] = "Cannot create new company. #{@company.errors.full_messages}"
      redirect_to new_company_path
    end
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_with(params[:"#{@company.type.underscore}"])
      flash[:notice] = "#{@company.name} was updated."
    else
      flash[:error] = "Cannot update #{@company.name}. #{@company.errors.full_messages}"
    end
    redirect_to company_path(@company)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Company '#{@company.name}' was deleted."
    redirect_to root_path
  end

end
