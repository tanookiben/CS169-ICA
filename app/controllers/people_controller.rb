class PeopleController < ApplicationController

  def index
    @search_term = params[:search]
    @individuals = Individual.search(@search_term)
    @board_members = BoardMember.search(@search_term)
    @advisors = Advisor.search(@search_term)
  end

  def create
    @person = Person.new()
    @person.update_with(params[:person])
    flash[:notice] = "#{@person.full_name} was created."
    redirect_to root_path
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
    @person.update_with(params[:"#{@person.type.underscore}"])
    flash[:notice] = "#{@person.full_name} was updated."
    redirect_to person_path(id)
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    flash[:notice] = "Person '#{@person.full_name}' was deleted."
    redirect_to root_path
  end

end
