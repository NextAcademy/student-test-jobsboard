class JobsController < ApplicationController
  def index
  	@jobs = Job.where(status: 1).page(params[:page]).per(25)
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

  def update
    @job = Job.find(params[:id])
    authorize @job
    @job.update(job_params)
    if @job.save
      flash[:success] = "Job status updated!"
    else
      flash[:error] = "Job status failed to update."
    end
    redirect_to authenticated_jobs_path
  end

  private

	  def job_params
	  	params.require(:job).permit(:title, :job_description, :location, :job_poster_email, :company_name, {:employment_terms => []}, :status)
	  end
end
