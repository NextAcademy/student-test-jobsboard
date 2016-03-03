class CompaniesController < ApplicationController
  def index
  	@companies = Company.where(status: 1).page(params[:page]).per(10) # only approved companies get shown in index
  end

  def new
  	@company = Company.new
  end

  def create
  	@company = Company.new(company_params)
  	if @company.save
  		flash[:success] = "Awesome, your company submission has been created."
  		redirect_to sign_up_path
  	else
  		flash[:error] = "Submission failed, please ensure that the company details are input correctly."
  		render "new"
  	end
  end

  private

	  def company_params
	  	params.require(:company).permit(:company_logo, :company_profile, :company_name, :hr_email, :talent_requirements)
	  end
end
