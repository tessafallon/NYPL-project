class ClaimsController < ApplicationController
	def index
		@claims = Claim.all
	end

	def show
		# @claim = Claim.find(params[:id])
    render 'diagnostics'
	end

	def edit
		@claim = Claim.find(params[:id]) 
    @claim = Claim.create if @claim.nil?
    @claimant_name = @claim.claimant_attr("name")
  end

  def update
    @claim = Claim.find(params[:id]) 
    @claim.update_attributes(params[:claim])
    @person = Person.create(person_params)
    # debugger
    render 'diagnostics'

  end

  def claim_params
    params.require(:claim).permit(:claim_date, :incident_date, :resolution_date, :claim_number, :record_number, :incident_address, :incident_address_type, :total_claimed, :total_awarded)
  end

   def person_params
    params.require(:person).permit(:name, :previous_address, :current_address, :role, :gender, :race, :claim_id)
  end

end
