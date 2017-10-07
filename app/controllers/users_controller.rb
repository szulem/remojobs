class UsersController < ApplicationController
	def create
	  @user = User.create(user_params)
	end

	def update
		if @job.update(jobs_params)
			redirect_to @job, notice: "Successfully updated Job"
		else
			render "Edit"
		end
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:logo, :company)
	end
end
