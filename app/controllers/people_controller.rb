class PeopleController < ApplicationController

  def create
    @person = Person.new
    if @person.update_with(params[:person])
      redirect_to person_path(@person), :notice => "#{@person.name} was created."
    else 
      flash[:error] = "Cannot create new person. #{@person.errors.full_messages} original"
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
      redirect_to person_path(@person), :notice => "#{@person.name} was updated."
    else
      flash[:error] = "Cannot update. #{@person.errors.full_messages}"
      redirect_to edit_person_path(@person)
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to root_path, :notice => "Person '#{@person.name}' was deleted."
  end

end
