class PeopleController < ApplicationController

  def create
    @person = Person.new
    if @person.update_with(params[:person])
      flash[:notice] = "#{@person.name} was created."
      redirect_to person_path(@person)
    else 
      flash[:error] = "Cannot create new person. #{@person.errors.full_messages}"
      redirect_to new_person_path
    end
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
    @person = Person.find(params[:id])
    if @person.update_with(params[:"#{@person.type.underscore}"])
      flash[:notice] = "#{@person.name} was updated."
    else
      flash[:error] = "Cannot update #{@person.name}. #{@person.errors.full_messages}"
    end
    redirect_to person_path(@person)
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    flash[:notice] = "Person '#{@person.name}' was deleted."
    redirect_to root_path
  end

end
