class ClaimsController < ApplicationController
	def index
		@claims = Claim.all
    respond_to do |format|
      format.html
      format.json do
        render(:json => @claims)
      end
    end
	end

	def show
		# @claim = Claim.find(params[:id])
    # render 'diagnostics'
	end

	def edit
		@claim = Claim.find(params[:id]) 
    @claim = Claim.create if @claim.nil?
  end

  def update
    claim = Claim.find(params[:id]) 
    claim.update_attributes(params[:claim])
    claim.update_claimant(person_params)
    claim.update_examiner(examiner_params)
    render 'diagnostics'
  end

  def claim_params
    params.require(:claim).permit(:claim_date, :incident_date, :resolution_date, :claim_number, :record_number, :incident_address, :incident_address_type, :total_claimed, :total_awarded, :examiners)
  end

  def person_params
    params.require(:person).permit(:name, :previous_address, :current_address, :role, :gender, :race, :claim_id)
  end

  def examiner_params
    params.require(:examiner).permit(:id, :name, :claims)
  end

end
