class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	def new 
		@job = Job.new
	end

	def create
		p "In the create method!!!!!!"
		job = Job.new(job_params)
		if job.save 
			redirect_to jobs_path
		else
			flash[:error] = "Error: please fill the required fields (title, company, description)"
			redirect_to :back
		end
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update_attributes(job_params)
		redirect_to jobs_path
	end

	def destroy 
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

	def show 
		@job = Job.find(params[:id])
	end

	private

	def job_params
		params.require(:job).permit(:title, :company, :location, :description)
	end
end
