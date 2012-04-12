class PeopleController < ApplicationController

  def index
    @search_term = params[:search]
    @individuals = @search_term ? Individual.search(@search_term) : Individual.all
    @board_members = @search_term ? BoardMember.search(@search_term) : BoardMember.all
    @advisors = @search_term ? Advisor.search(@search_term) : Advisor.all
  end

  def create
    @person = Person.new
    if @person.update_with(params[:person])
      flash[:notice] = "#{@person.full_name} was created."
    else 
      flash[:error] = "Cannot create new person. #{@person.errors.messages}"
    end
    redirect_to person_path(@person)
  end

  def new
    @person = Person.new
    @person.build_phone_number
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
      flash[:notice] = "#{@person.full_name} was updated."
    else
      flash[:error] = "Cannot update #{@person.full_name}. #{@person.errors.messages}"
    end
    redirect_to person_path(@person)
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    flash[:notice] = "Person '#{@person.full_name}' was deleted."
    redirect_to people_path
  end

end
