class Authenticated::AdminController < ApplicationController
	before_action :require_admin
	
	def companies
		@companies_per_page = 12
		@companies = Company.where(status: 0).page(params[:page]).per(@companies_per_page)
	end

	def jobs
		@jobs_per_page = 12
		@jobs = Job.where(status: 0).page(params[:page]).per(@jobs_per_page)
	end

	private

		def require_admin
			if current_user.admin? == false
				raise ActionController::RoutingError.new('Not Found') 
				#fake 404 for security reasons
			end
		end
end
