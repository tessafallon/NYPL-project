class ClaimsController < ApplicationController
	def index
		@claims = Claim.all
	end

	def show
		@claim = Claim.find(params[:id])
	end

	def edit
		@claim = Claim.find(params[:id]) 
    @claim = Claim.create if @claim.nil? 
  end

  def update
    @claim = Claim.find(params[:id])
    redirect_to (action: "show", id: @claim.id, status: 302)
	end

end
