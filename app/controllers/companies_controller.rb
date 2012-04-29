class CompaniesController < ApplicationController

  def create
    @company = Company.new
    params[:company] = params[:company].merge({:representative_id => Person.search(params[:company][:representative_name]).first.id}).except(:representative_name)
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
    params[:"#{@company.type.underscore}"] = params[:"#{@company.type.underscore}"].merge({:representative_id => Person.search(params[:"#{@company.type.underscore}"][:representative_name]).first.id}).except(:representative_name)
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
