class Authenticated::AdminController < ApplicationController
	before_action :require_admin
	
	def index
		@companies = Company.where(status: 0).page(params[:page]).per(@companies_per_page)
	end

	private

		def require_admin
			if current_user.admin? == false
				raise ActionController::RoutingError.new('Not Found') #fake 404 for security
			end
		end
end
