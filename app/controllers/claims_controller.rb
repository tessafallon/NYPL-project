class ClaimsController < ApplicationController
	def index
		@claims = Claim.all
	end

	def show
		# @claim = Claim.find(params[:id])
	end

	def edit
		# @claim = Claim.find(parms[:id])
	end

	def update
	end

end
