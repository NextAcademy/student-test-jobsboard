class Authenticated::AdminController < ApplicationController
	before_action :require_admin
	
	def index
		@companies = Company.where(status: 0)
	end

	private

		def require_admin
			if current_user.admin? == false
				raise ActionController::RoutingError.new('Not Found') #fake 404 for security
			end
		end
end
