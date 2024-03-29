class CompaniesController < ApplicationController

  def index
  	@companies_per_page = 10
    @companies = Company.where(status: 1).page(params[:page]).per(@companies_per_page)
     # only approved companies get shown in index
  end

  def new
  	@company = Company.new
    authorize @company
  end

  def create
  	@company = Company.new(company_params)
    authorize @company
  	if @company.save
  		flash[:success] = "Awesome, your company submission will be displayed upon approval."
  		redirect_to sign_up_path
  	else
  		flash[:error] = "Submission failed, please ensure that the company details are input correctly."
  		render "new"
  	end
  end

  def update
    @company = Company.find(params[:id])
    authorize @company
    @company.update(company_params)
    if @company.save
      flash[:success] = "Company status updated!"
    else
      flash[:error] = "Company status failed to update."
    end
    redirect_to authenticated_companies_path
  end

  private

	  def company_params
	  	params.require(:company).permit(:company_logo, :company_profile, :company_name, :hr_email, {:talent_requirements => []}, :status, :company_url, :technology_stack, :culture, :team_info)
	  end
end
