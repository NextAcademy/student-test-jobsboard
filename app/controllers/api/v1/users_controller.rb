class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :require_login


	def create
		if request.env[:HTTP_TOKEN] == ENV['access_token']
			create_user
		else
			render json: {success: 'false', message: 'Token authentication failed!'}, status: 401
		end
	end

	private

		def create_user
			@user = User.new(email: params[:email], password: generate_password)
			if @user.save
				#insert action mailer here!
				render json: {success: 'true', message: "User created successfully."}, status: 200
			else
				render json: {success: 'false', message: 'Unable to create user, please check with admin.'}, status: 500
			end
		end

		def generate_password
			(0...8).map { (65 + rand(26)).chr }.join
		end
end
