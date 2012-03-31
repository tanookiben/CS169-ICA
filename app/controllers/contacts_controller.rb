class ContactsController < ApplicationController
  def index
    @search = params[:search]
    @people = Person.search(@search)
  end

  def show
    term = params[:term]
    @people = Person.find_all_by_first_name(term)
  end

  def search
    @people = Person.search(params[:search])
  end
end
