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
  end

  def update
    @claim = Claim.find(params[:id]) 
    @claim.update_attributes(params[:claim])
    redirect_to @claim
  end

end
