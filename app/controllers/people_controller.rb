class PeopleController < ApplicationController
    
  def person_params
    params.require(:person).permit(:name, :previous_address, :current_address, :role, :gender, :race)
  end
end