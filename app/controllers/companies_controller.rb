class CompaniesController < ApplicationController

  def create
    @company = Company.new
    if params[:company][:representative_name].blank?
      flash[:error] = "Please include a representative."
      redirect_to new_company_path and return
    end
    params[:company] = params[:company].merge({:representative_id => Person.search(params[:company][:representative_name]).first.id}).except(:representative_name)
    if @company.update_with(params[:company])
      redirect_to company_path(@company), :notice => "#{@company.name} was created."
    else 
      flash[:error] = "Cannot create new company. #{@company.errors.full_messages}"
      redirect_to new_company_path
    end
  end

  def new
    @company = Company.new
    @representatives = Individual.all.collect{ |i| i.name }
  end

  def edit
    @company = Company.find(params[:id])
    @representatives = Individual.all.collect{ |i| i.name }
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if params[:"#{@company.type.underscore}"][:representative_name].blank?
      flash[:error] = "Please include a representative."
      redirect_to edit_company_path(@company) and return
    end
    params[:"#{@company.type.underscore}"] = params[:"#{@company.type.underscore}"].merge({:representative_id => Person.search(params[:"#{@company.type.underscore}"][:representative_name]).first.id}).except(:representative_name)
    if @company.update_with(params[:"#{@company.type.underscore}"])
      redirect_to company_path(@company), :notice => "#{@company.name} was updated."
    else
      flash[:error] = "Cannot update #{@company.name}. #{@company.errors.full_messages}"
      redirect_to edit_company_path(@company)
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to root_path, :notice => "Company '#{@company.name}' was deleted."
  end

end
