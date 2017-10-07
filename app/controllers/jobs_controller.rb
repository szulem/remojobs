class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	# before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		if params[:category].blank?
			@jobs = Job.all.order("updated_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("updated_at DESC")
		end
	end

	def show
	end

	def new
		# @job = Job.new
		@job = current_user.jobs.build
	end

	def create
		# @job = Job.new(jobs_params)
		@job = current_user.jobs.build(jobs_params)

		if @job.save
			redirect_to @job, notice: "Successfully added new Job"
		else
			render 'New'
		end
	end

	def edit
	end

	def update
		# we set user_id of job to id of current_user
		@job.user_id = current_user.id

		if @job.update(jobs_params)
			redirect_to @job, notice: "Successfully updated Job"
		else
			render "Edit"
		end
	end

	def destroy
		@job.destroy
		redirect_to root_path
	end

	private

	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url, :category_id, :user_id)
	end

	def find_job
		@job = Job.find(params[:id])
	end
end
