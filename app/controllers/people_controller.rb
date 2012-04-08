class PeopleController < ApplicationController

  def index
    @search = params[:search]
    @individuals = Individual.search(@search)
    @board_members = BoardMember.search(@search)
    @advisors = Advisor.search(@search)
  end

  def create
    @person = Person.new()
    updated_values = params[:person]
    @person.update_attributes!(updated_values.except(:type))
    @person.update_attribute(:type, updated_values[:type])
#    if isSuccessful?
#      flash[:notice] = "#{@person.full_name} was successfully created."
#    else
#      flash[:error] = "#{@person.full_name} was unable to be created."
#    end
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
    updated_values = params[:"#{@person.type.underscore}"]
    # Type is separately updated because, as a STI specific property, it cannot
    # be mass-assigned with update_attributes. Order of update is also important
    @person.update_attributes!(updated_values.except(:type))
    @person.update_attribute(:type, updated_values[:type])
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
