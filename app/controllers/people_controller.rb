class PeopleController < ApplicationController

  def index
    @search = params[:search]
    @people = Person.search(@search)
  end

  def create
    if @person = Person.create(params[:person])
      flash[:notice] = "#{@person.full_name} was successfully created."
    else
      flash[:error] = "#{@person.full_name} was unable to be created."
    end
    redirect_to people_path
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def show
    @person = Person.find(params[:id])
  end

  def update
    id = params[:id]
    @person = Person.find(id)
    @person.update_attributes!(params[:person])
    flash[:notice] = "#{@person.full_name} was successfully updated."
    redirect_to person_path(id)
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    flash[:notice] = "Person '#{@person.full_name}' deleted."
    redirect_to people_path
  end
end
