class PeopleController < ApplicationController
  def index
    @search = params[:search]
    @people = Person.search(@search)
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.create
  end

  def edit
    @person = Person.create()
  end
end
