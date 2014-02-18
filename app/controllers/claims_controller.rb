class ClaimsController < ApplicationController
	def index
		@claims = Claim.all
	end

	def show
		# @claim = Claim.find(params[:id])
	end

	def edit
		@claim = Claim.new #Using new claim to test 
	end

	def update
    render "diagnostics"
	end

end
