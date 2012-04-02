class PeopleController < ApplicationController
  def index
    @search = params[:search]
    @people = Person.search(@search)
  end

  def create
  end

  def new
    @person = Person.create
  end

  def edit
    @person = Person.create()
  end

  def show
    @id = params[:id]
    @person = Person.find(@id)
  end

  def update
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    flash[:notice] = "Person '#{@person.first_name + ' ' + @person.last_name}' deleted."
    redirect_to people_path
  end
end
