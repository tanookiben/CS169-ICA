class ContactsController < ApplicationController
  def index
    @search = params[:search]
    @people = Person.search(@search)
  end

  def show
    @person = Person.find(params[:id])
  end

end
