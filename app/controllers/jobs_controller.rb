class JobsController < ApplicationController
  def index
  	@jobs = Job.page(params[:page]).per(25)
  end

  def new
  	@job = Job.new
    authorize @job
  end

  def create
  	@job = Job.new(job_params)
    authorize @job
  	if @job.save
  		flash[:success] = "Admin notified, your job post will be visible once approved."
  		redirect_to root_path
  	else
  		flash[:error] = "Job failed to create! Make sure all fields are correctly filled up."
  		render "new"
  	end
  end

  private

	  def job_params
	  	params.require(:job).permit(:title, :job_description, :location, :job_poster_email, :company_name, {:employment_terms => []})
	  end
end
